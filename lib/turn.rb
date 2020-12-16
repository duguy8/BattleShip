class Turn
attr_reader :user,
            :opponent,
            :user_coordinate,
            :opp_coordinate,
            :game_over
  def initialize(user, opponent)
    @user = user
    @opponent = opponent
    @user_coordinate = []
    @opp_coordinate = []
    @game_over = false
  end

  def player_ship_placement
    cruiser = Ship.new("Cruiser", 3)
      p "I have laid out my ships on the grid."
      p "You now need to lay out your two ships."
      p "The Cruiser is three units long and the Submarine is two units long."
      puts (opponent.board.render)
      p "Enter the squares for the Cruiser (3 spaces):"
    cruiser_placement = gets.chomp
    placements = cruiser_placement.split
    until user.board.valid_placement?(cruiser, placements) == true
      p "Those are invalid coordinates. Please try again:"
      cruiser_placement = gets.chomp
      placements = cruiser_placement.split
    end
    user.board.place(cruiser, placements)
    player_submarine_placement
  end

  def player_submarine_placement
    submarine = Ship.new("Submarine", 2)
      puts (user.board.render(true))
      p "Enter the squares for the Submarine (2 spaces):"
    submarine_placement = gets.chomp
    placements = submarine_placement.split
    until user.board.valid_placement?(submarine, placements) == true
      p "Those are invalid coordinates. Please try again:"
      submarine_placement = gets.chomp
      placements = submarine_placement.split
    end
    user.board.place(submarine, placements)
    player_fire
  end

  def display_board
    p '=============COMPUTER BOARD============='
    puts (opponent.board.render)
    p '=============PLAYER BOARD============='
    puts (user.board.render(true))
  end

  def player_fire
    display_board
    if @user_coordinate.length > 0
      @user_coordinate.clear
    else
    end
    p 'Enter the coordinate for your shot:'
    coordinate = gets.chomp.upcase
    until (opponent.board.valid_coordinate?(coordinate) == true) &&
          (opponent.board.cells[coordinate].fired_upon? == false)
      p 'Please enter a valid coordinate:'
      coordinate = gets.chomp.upcase
    end
    @user_coordinate.push(coordinate)
    opponent.board.cells[coordinate].fire_upon
    if opponent.computer_game_over? == true
      @game_over = true
    elsif opponent.computer_game_over? == false
      computer_fire
    end
  end

  def computer_fire
    if @opp_coordinate.length > 0
      @opp_coordinate.clear
    else
    end
    random_shot = user.board.cells.keys.sample
    computer_shots = []
    if computer_shots.include?(random_shot)
      computer_fire
    else
    end
    @opp_coordinate.push(random_shot)
    user.board.cells[random_shot].fire_upon
    turn_results
    if user.player_game_over? == true
      @game_over = true
    elsif user.player_game_over? == false
      player_fire
    end
  end

  def turn_results
    if opponent.board.cells[@user_coordinate[0]].render == " M"
      p "Your shot on #{@user_coordinate[0]} was a miss."
    elsif opponent.board.cells[@user_coordinate[0]].render == " X"
      p "You have sunk a ship!"
    elsif opponent.board.cells[@user_coordinate[0]].render == " H"
      p "Your shot on #{@user_coordinate[0]} was a hit."
    else
    end

    if user.board.cells[@opp_coordinate[0]].render == " M"
      p "My shot on #{@opp_coordinate[0]} was a miss."
    elsif user.board.cells[@opp_coordinate[0]].render == " X"
      p "I have sunk a ship!"
    elsif user.board.cells[@opp_coordinate[0]].render == " H"
      p "My shot on #{@opp_coordinate[0]} was a hit."
    else
    end
  end

  # def game_over
  #   if user.board.render(true).count('S') == 0
  #     true
  #     p "I won!"
  #   elsif opponent.board.render.count('X') == 5
  #     true
  #     p "You won!"
  #   else
  #     false
  #   end
  # end

  # def game_over
  #   if user.board.render(true).count('S') == 0
  #     true
  #     p "I won!"
  #   elsif opponent.board.render.count('X') == 5
  #     true
  #     p "You won!"
  #   else
  #     false
  #   end
  # end
end
