class Turn
attr_reader :user, :opponent
  def initialize(user, opponent)
    @user = user
    @opponent = opponent
  end

  def player_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    opponent.randomly_placed_ship(cruiser)
    opponent.randomly_placed_ship(submarine)
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
    cruiser = Ship.new("Cruiser", 3)
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
    p 'Enter the coordinate for your shot:'
    coordinate = gets.chomp.upcase
    until (opponent.board.valid_coordinate?(coordinate) == true) &&
          (opponent.board.cells[coordinate].fired_upon? == false)
      p 'Please enter a valid coordinate:'
      coordinate = gets.chomp.upcase
    end
    opponent.board.cells[coordinate].fire_upon
    computer_fire
  end

  def computer_fire
    computer_shots = []
    random_shot = user.board.cells.keys.sample
    computer_shots.push(random_shot)

    until (user.valid_coordinate?(random_shot) == true) &&
          (user.board.cells[random_shot].fired_upon? == false)
      computer_fire
    end
    user.board.cells[random_shot].fire_upon
    turn_results
    player_fire
  end

  def turn_results

  end
end
