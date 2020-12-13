require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'

class PlayerTest < MiniTest::Test

  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_player_can_have_board
    player = Player.new
    player_board = "  1 2 3 4 \n" +
                    "A . . . . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"
    assert_equal player_board, player.board.render
  end
end
