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

  def test_player_can_place_cruiser
    player = Player.new
    cruiser = Ship.new("Cruiser", 3)
    player.place(cruiser, ["A1", "A2", "A3"])
    player_board =  "  1 2 3 4 \n" +
                    "A S S S . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"
    assert_equal player_board, player.board.render(true)
  end

  def test_player_can_place_submarine
    # skip
    player = Player.new
    submarine = Ship.new("Submarine", 2)
    player.place(submarine, ["A1", "A2"])
    player_board =  "  1 2 3 4 \n" +
                    "A S S . . \n" +
                    "B . . . . \n" +
                    "C . . . . \n" +
                    "D . . . . \n"
    assert_equal player_board, player.board.render(true)
  end

  def test_player_can_place_two_ships
    # skip
    player = Player.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player.place(cruiser, ["A1", "A2", "A3"])
    player.place(submarine, ["C1", "C2"])
    counter = (player.board.render(true).count "S")
    assert_equal 5, counter
  end
end
