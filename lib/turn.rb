class Turn
attr_reader :user, :opponent
  def initialize(user, opponent)
    @user = user
    @opponent = opponent
  end

  def start
    p 'COMPUTER BOARD'
    p (opponent.board.render)
    p 'PLAYER BOARD'
    p (user.board.render)
  end

  def fire(coordinate)
    opponent.board.cells.map do |each_cell, ship|
      
    end
  end
end
