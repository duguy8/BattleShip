 require 'minitest/autorun'
 require 'minitest/pride'
 require './lib/ship'
 require './lib/cell'
 require './lib/board'
 require './lib/computer'

 class ComputerTest < Minitest::Test
 def test_it_exists
   computer = Computer.new
 assert_instance_of Computer, computer
 end

 def test_computer_can_have_a_board
 # skip
   computer = Computer.new
   computer_board = "  1 2 3 4 \n" +
                    "A . . . . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"
 assert_equal computer_board, computer.board.render
 end

 def test_for_randomly_placed_cruiser
 # skip
  computer = Computer.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  computer.randomly_placed_ship(cruiser)
  counter = (computer.board.render(true).count "S")
  assert_equal 3, counter
 end

 def test_for_randomly_placed_submarine
 # skip
  computer = Computer.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  computer.randomly_placed_ship(submarine)
  counter = (computer.board.render(true).count "S")
  # require "pry"; binding.pry
  assert_equal 2, counter
 end

 def test_for_randomly_placed_ships
 # skip
  computer = Computer.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  computer.randomly_placed_ship(submarine)
  computer.randomly_placed_ship(cruiser)
  counter = (computer.board.render(true).count "S")
  require "pry"; binding.pry
  assert_equal 5, counter
 end
end
