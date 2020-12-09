class Cell
  attr_reader :cell_number

  def initialize(cell_number)
    @cell_number = cell_number
  end

  def coordinate
    "B4"
  end

  def ship
    nil
  end
end
