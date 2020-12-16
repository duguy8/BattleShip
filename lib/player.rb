class Player
  attr_reader :board
  def initialize
    @board = Board.new
    @taken_coordinates = []
  end

  def place(ship, coordinates)
    if board.valid_placement?(ship, coordinates) == true
      @board.cells.map do |key, value|
        coordinates.map do |coordinate|
          @board.cells[coordinate].place_ship(ship)
        end
      end
    @taken_coordinates << coordinates
    @taken_coordinates = @taken_coordinates.flatten
    else
    end
  end

  def player_game_over?
    if board.render(true).count('S') == 0
      p "I won!"
      true
    else
      false
    end
  end
end
