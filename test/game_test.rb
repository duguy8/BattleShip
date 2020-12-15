require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < MiniTest::Test
  def test_the_game_exists
    new_game = Game.new
    assert_instance_of Game, new_game
  end
end
