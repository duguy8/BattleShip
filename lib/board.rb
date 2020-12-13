class Board
  attr_reader :cells

  def initialize
    @key_letter = ["A", "B", "C", "D"]
    @key_number = ["1", "2", "3", "4"]
    @cells = make_board
  end

  def place(cruiser, coordinates)
   @cells.map do |key, value|
     coordinates.map do |coordinate|
       @cells[coordinate].place_ship(cruiser)
      end
    end
     #will need if/else statement for valid_placement?
   end


  def make_board
    board = {}
    @key_letter.map do |letter|
      @key_number.map do |number|
      board[letter + number] = Cell.new(letter + number)
      end
    end
    board
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_placement?(ship_name, placements)
    placement_number = []
    placement_letter = []
    placements.each do |placement_num|
      placement_number << placement_num[1].to_i
    end
    placements.each do |placement_let|
      placement_letter << placement_let[0].ord
    end
    if (placement_letter.uniq.count == 1 &&
      placement_number.each_cons(2).all?{|x,y| y == x + 1}) &&
      (placements.length == ship_name.length)
      true
    elsif (placement_number.uniq.count == 1 &&
      placement_letter.each_cons(2).all?{|x,y| y == x + 1}) &&
      (placements.length == ship_name.length)
      true
    else
      false
    end
  end
end
