class Board
  attr_reader :cells

  def initialize
    @key_letter = ["A", "B", "C", "D"]
    @key_number = ["1", "2", "3", "4"]
    @cells = make_board
<<<<<<< HEAD
  end

  def place(cruiser, coordinates)
   @cells.map do |key, value|
     coordinates.map do |coordinate|
       @cells[coordinate].place_ship(cruiser)
      end
    end
     #will need if/else statement for valid_placement?
   end

=======
    @taken_coordinates = []
  end

  def render(rendered = false)
    new_board = nil
    line_1 = "  1 2 3 4"
    line_2 = "A"
    line_3 = "B"
    line_4 = "C"
    line_5 = "D"

    @cells.each do |key, ship|
      if (ship.coordinate.ord == 65 && ship.ship.nil? == false) && rendered == true
        line_2.concat(" S")
      elsif ship.coordinate.ord == 65
        line_2.concat(" .")
      elsif ship.coordinate.ord == 66
        line_3.concat(" .")
      elsif ship.coordinate.ord == 67
        line_4.concat(" .")
      elsif ship.coordinate.ord == 68
        line_5.concat(" .")
      end
    end
    new_board = line_1.concat(" \n") + line_2.concat(" \n") + line_3.concat(" \n") +
    line_4.concat(" \n") + line_5.concat(" \n")
    new_board
  end

  def place(cruiser, coordinates)
    @cells.map do |key, value|
      coordinates.map do |coordinate|
        @cells[coordinate].place_ship(cruiser)
      end
    end
    @taken_coordinates << coordinates
    @taken_coordinates = @taken_coordinates.flatten
  end
>>>>>>> 6c90b1eb6eed4ea1faf35815f8b9177b6487b73a

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
<<<<<<< HEAD
    if (placement_letter.uniq.count == 1 &&
=======

    if (@taken_coordinates & placements).length >= 1
      false
    elsif (placement_letter.uniq.count == 1 &&
>>>>>>> 6c90b1eb6eed4ea1faf35815f8b9177b6487b73a
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
