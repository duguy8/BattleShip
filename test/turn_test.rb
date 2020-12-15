require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/turn'

class TurnTest < MiniTest::Test
  def test_the_class_exists
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    assert_instance_of Turn, turn
  end

  def test_turn_has_player_and_computer
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    assert_equal player, turn.user
    assert_equal computer, turn.opponent
  end

  def test_start_of_turn_displays_boards
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    assert_equal computer.board.render, turn.start
    assert_equal player.board.render, turn.start
  end

  def test_player_can_fire
    cruiser = Ship.new("Cruiser", 3)
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    computer.board.place(cruiser, ["A1", "A2", "A3"])
    board_with_miss = "  1 2 3 4 \n" +
                      "A H S S . \n" +
                      "B . . . . \n" +
                      "C . . . . \n" +
                      "D . . . . \n"
    # require 'pry'; binding.pry
    turn.fire("A1")
    assert_equal board_with_miss, computer.board.render(true)
  end
end
