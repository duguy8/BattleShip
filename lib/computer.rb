class Computer
  attr_reader :board

  def initialize
    @board = Board.new
    @taken_coordinates = []
  end

  #cruiser method must be run first

  def randomly_place_submarine
    submarine = Ship.new("Submarine", 2)
    sub_coordinates = []
    2.times do
      sub_coordinates.push(board.cells.keys.sample)
    end
    if board.valid_placement?(submarine, sub_coordinates) == true && @taken_coordinates.none?(sub_coordinates)
      sub_coordinates.map do |coordinate|
        @board.cells[coordinate].place_ship(submarine)
        @taken_coordinates << coordinate
      end.flatten
    else
      randomly_place_submarine
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
      end
      else
        randomly_place_cruiser
      end.flatten
    end
  end


    # require "pry"; binding.pry
    # cruiser = Ship.new("Cruiser", 3)
#
#
#
#     submarine = Ship.new("Submarine", 2)
#
#
#     random_coordinates = []
#     until (board.valid_placement?(cruiser, random_coordinates) == true) do
#     (cruiser.length).times do
#       random_coordinate = board.cells.keys.sample
#       random_coordinates << random_coordinate if @taken_coordinates.none?(random_coordinate)
#         if random_coordinates.length > cruiser.length
#           random_coordinates.clear
#         end
#       end
#     end
#     random_coordinates.map do |coordinate|
#       @board.cells[coordinate].place_ship(cruiser)
#       @taken_coordinates << coordinate
#       @taken_coordinates = @taken_coordinates.flatten
#     end
#   end
# end
