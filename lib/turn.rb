class Turn
attr_reader :user, :opponent
  def initialize(user, opponent)
    @user = user
    @opponent = opponent
  end

  def player_ship_placement
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    puts (opponent.board.render)
    p "Enter the squares for the Cruiser (3 spaces):"

    cruiser = Ship.new("Cruiser", 3)
    cruiser_placement = gets.chomp
    placements = cruiser_placement.split
    if user.board.valid_placement?(cruiser, placements)
      user.board.place(cruiser, placements)
    else
      p "Those are invalid coordinates. Please try again:"
      gets.chomp
      player_ship_placement
    end
    player_submarine_placement
  end

  def player_submarine_placement
    puts (user.board.render(true))

    p "Enter the squares for the Submarine (2 spaces):"

    submarine = Ship.new("Submarine", 2)
    submarine_placement = gets.chomp
    placements = submarine_placement.split
    if user.board.valid_placement?(submarine, placements)
      user.board.place(submarine, placements)
    else
      p "Those are invalid coordinates. Please try again:"
      gets.chomp
      player_submarine_placement
    end
    display_board
  end

  def display_board
    p '=============COMPUTER BOARD============='
    puts (opponent.board.render)
    p '=============PLAYER BOARD============='
    puts (user.board.render(true))
  end

  def player_fire(coordinate)
    opponent.board.cells[coordinate].fire_upon
  end

  def computer_fire
    random_shot = user.board.cells.keys.sample
    user.board.cells[random_shot].fire_upon
  end
end
