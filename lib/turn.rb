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

    cruiser_placement = gets.chomp
    #need to validate placement & place ship
    # if coordinates are invalid p "Those are invalid coordinates. Please try again:"

    puts (user.board.render(true))

    p "Enter the squares for the Submarine (2 spaces):"

    submarine_placement = gets.chomp
    #need to valid placement & place ship
    # if coordinates are invalid p "Those are invalid coordinates. Please try again:"

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
    # random_coordinate = nil
    # player.board.cells[random_coordinate].fire_upon
  end
end
