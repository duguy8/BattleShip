require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
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
  def test_readable_attributes
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    assert_equal false, turn.game_over
    assert_equal 0, turn.shot_counter
    assert_equal [], turn.user_coordinate
    assert_equal [], turn.opp_coordinate
  end
end
