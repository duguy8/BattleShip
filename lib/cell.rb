class Cell
  attr_reader :cell_number, :empty, :ships

  def initialize(cell_number)
    @cell_number = cell_number
    @empty = true
    @ships = []
  end

  def not_empty
    @empty = false
  end

  def coordinate
    "B4"
  end

  def ship
    if empty == true
      nil
    else
      ships.shift
      #might not work later in Iteration 2
    end
  end

  def empty?
    empty
  end

  def place_ship(cruiser)
    ships << cruiser
    # require 'pry'; binding.pry
    not_empty
  end
end
