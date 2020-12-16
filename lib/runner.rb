# require './ship'
# require './cell'
# require './board'
# require './computer'
# require './player'
# require './turn'
# require './game'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'
require './lib/turn'
require './lib/game'

cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
player = Player.new
computer = Computer.new
turn = Turn.new(player, computer)
game = Game.new(turn)

game.start
