class Turn
attr_reader :user,
            :opponent,
            :user_coordinate,
            :opp_coordinate,
            :game_over,
            :shot_counter
            
  def initialize(user, opponent)
    @user = user
    @opponent = opponent
    @user_coordinate = []
    @opp_coordinate = []
    @game_over = false
    @shot_counter = 0
  end

  def player_ship_placement
    cruiser = Ship.new("Cruiser", 3)
      puts (opponent.board.render)
      p 'Enter the squares for the Cruiser (3 spaces):'
    cruiser_placement = gets.chomp
    placements = cruiser_placement.split
    until user.board.valid_placement?(cruiser, placements) == true
      p 'Those are invalid coordinates. Please try again:'
      cruiser_placement = gets.chomp
      placements = cruiser_placement.split
    end
    user.board.place(cruiser, placements)
    player_submarine_placement
  end

  def player_submarine_placement
    submarine = Ship.new("Submarine", 2)
      puts (user.board.render(true))
      p 'Enter the squares for the Submarine (2 spaces):'
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
    @shot_counter += 1
    if @opp_coordinate.length > 0
      @opp_coordinate.clear
    else
    end
    computer_shots = []
    random_shot = user.board.cells.keys.sample
    if @shot_counter == 1
      computer_shots.push(random_shot)
      @opp_coordinate.push(random_shot)
      user.board.cells[random_shot].fire_upon
    elsif @shot_counter > 1 && computer_shots.none?(random_shot)
      random_shot = user.board.cells.keys.sample
      computer_shots = []
      computer_shots.push(random_shot)
      @opp_coordinate.push(random_shot)
      user.board.cells[random_shot].fire_upon
    else
      computer_fire
    end
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
end
