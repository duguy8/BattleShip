class Board
  attr_reader :key_letter, :key_number

  def initialize
    @key_letter = ["A", "B", "C", "D"]
    @key_number = ["1", "2", "3", "4"]
  end

  def cells
    cell_hash = Hash.new
    key_letter.each do |letter|
      key_number.each do |number|
      cell_hash[letter + number] = Cell.new(letter + number)
      end
    end
    cell_hash
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end
end
