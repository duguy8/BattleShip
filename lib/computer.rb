class Computer
  attr_reader :board

  def initialize
    @board = (Board.new)
    @taken_coordinates = []
  end

  def randomly_placed_ship(cruiser)
    random_coordinates = []
    until (board.valid_placement?(cruiser, random_coordinates) == true) do
    (cruiser.length).times do
      random_coordinate = board.cells.keys.sample
      random_coordinates << random_coordinate if @taken_coordinates.none?(random_coordinate)
        if random_coordinates.length > cruiser.length
          random_coordinates.clear
        end
      end
    end
    random_coordinates.map do |coordinate|
      @board.cells[coordinate].place_ship(cruiser)
      @taken_coordinates << coordinate
      @taken_coordinates = @taken_coordinates.flatten
    end
  end
end
