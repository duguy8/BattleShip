class Cell
  attr_reader :cell_number,
              :empty,
              :ships,
              :fired_upon

  def initialize(cell_number)
    @cell_number = cell_number
    @empty = true
    @ships = []
    @fired_upon = false
  end

  def fire_upon
    ship.hit
    @fired_upon = true
  end

  def fired_upon?
    fired_upon
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
    elsif empty == false
      ships[0]
      #might not work later in Iteration 2
    end

  end

  def empty?
    empty
  end

  def place_ship(cruiser)
    ships << cruiser
    not_empty
  end
end
