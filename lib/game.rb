class Game
  def initialize
  end

  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."

    press_start = gets.chomp
    if press_start != 'p' && press_start != 'q'
      start
    elsif press_start == 'q'
      return
    elsif press_start == 'p'
      turn.player_ship_placement
    end
  end

  def game_over
    # if you win
    #   p "You won!"
    # else computer wins
    #   p "I won!"
    # end
  end
end