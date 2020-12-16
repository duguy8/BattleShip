class Computer
  attr_reader :board

  def initialize
    @board = Board.new
    @taken_coordinates = []
  end

  def computer_game_over?
    if board.render.count('X') == 5
      p "You won!"
      true
    else
      false
    end
  end
  def randomly_place_cruiser
    cruiser = Ship.new("Cruiser", 3)
    cruiser_coordinates = []
    3.times do
      cruiser_coordinates.push(board.cells.keys.sample)
    end
    if board.valid_placement?(cruiser, cruiser_coordinates) == true
      cruiser_coordinates.map do |coordinate|
        @board.cells[coordinate].place_ship(cruiser)
        @taken_coordinates << coordinate
      end.flatten
    else
      randomly_place_cruiser
    end
  end
  def randomly_place_submarine
    submarine = Ship.new("Submarine", 2)
    sub_coordinates = []
    sub_coordinates.clear
    2.times do
      sub_coordinates.push(board.cells.keys.sample)
    end
    if board.valid_placement?(submarine, sub_coordinates) && board.is_cell_empty?(sub_coordinates)
        sub_coordinates.map do |coordinate|
        @board.cells[coordinate].place_ship(submarine)
      end.flatten
    else
      randomly_place_submarine
    end
    @taken_coordinates.clear
  end
end
