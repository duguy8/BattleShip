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
    turn.player_ship_placement
    assert_equal player, turn.user
    assert_equal computer, turn.opponent
  end

  def test_player_can_fire_and_hit
    skip
    cruiser = Ship.new("Cruiser", 3)
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    computer.board.place(cruiser, ["A1", "A2", "A3"])
    turn.player_fire("A1")
    counter = (computer.board.render(true).count "H")
    assert_equal 1, counter
  end

  def test_computer_can_fire_and_hit
    skip
    cruiser = Ship.new("Cruiser", 3)
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    player.board.place(cruiser, ["A1", "A2", "A3"])
    turn.computer_fire
    counter = (player.board.render(true).count "H")
    assert_equal 1, counter
  end

  def test_player_can_fire_and_miss
    skip
    cruiser = Ship.new("Cruiser", 3)
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    computer.board.place(cruiser, ["A1", "A2", "A3"])
    turn.player_fire("B1")
    counter = (computer.board.render(true).count "M")
    assert_equal 1, counter
  end

  def test_computer_can_fire_and_miss
    # skip
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    turn.computer_fire
    counter = (player.board.render(true).count "M")
    assert_equal 1, counter
  end

  def test_player_can_sink_a_ship
    skip
    cruiser = Ship.new("Cruiser", 3)
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    computer.board.place(cruiser, ["A1", "A2", "A3"])
    turn.player_fire("A1")
    turn.player_fire("A2")
    turn.player_fire("A3")
    counter = (computer.board.render(true).count "X")
    assert_equal 3, counter
  end

  def test_player_can_win
    skip
    cruiser = Ship.new("Cruiser", 3)
    player = Player.new
    computer = Computer.new
    turn = Turn.new(player, computer)
    computer.board.place(cruiser, ["A1", "A2", "A3"])
    computer.place(submarine, ["C1", "C2"])
    turn.player_fire("A1")
    turn.player_fire("A2")
    turn.player_fire("A3")
    turn.player_fire("C1")
    turn.player_fire("C2")
    counter = (computer.board.render(true).count "X")
    assert_equal 5, counter
  end
end
