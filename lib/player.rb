class Player
  attr_reader :board

  def initialize
    @board = Board.new
    @taken_coordinates = []
  end
end
