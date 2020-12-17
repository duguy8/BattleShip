class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
      p 'Welcome to BATTLESHIP'
      p 'Enter p to play. Enter q to quit.'
      press_start = gets.chomp
      if press_start != 'p' && press_start != 'q'
        start
      elsif press_start == 'q'
        return
      else press_start == 'p'
      self.play
      end
    end

    def play
      submarine = Ship.new("Submarine", 2)
      cruiser = Ship.new("Cruiser", 3)
      turn.opponent.randomly_place_cruiser
      turn.opponent.randomly_place_submarine
      p 'I have laid out my ships on the grid.'
      p 'You now need to lay out your two ships.'
      p 'The Cruiser is three units long and the Submarine is two units long.'
      turn.player_ship_placement
      while turn.game_over == false
        turn.player_fire
        turn.computer_fire
      end
    end
  end
