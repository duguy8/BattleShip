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
  computer.randomly_place_cruiser
  counter = (computer.board.render(true).count "S")
  assert_equal 3, counter
 end

 def test_for_randomly_placed_submarine
 # skip
  computer = Computer.new
  computer.randomly_place_submarine
  counter = (computer.board.render(true).count "S")
  assert_equal 2, counter
 end

 def test_for_randomly_placed_ships
 # skip
  computer = Computer.new
  computer.randomly_place_cruiser
  computer.randomly_place_submarine
  # require "pry"; binding.pry
  counter = (computer.board.render(true).count "S")
  assert_equal 5, counter
 end
end
