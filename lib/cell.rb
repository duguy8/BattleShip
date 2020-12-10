class Cell
  attr_reader :coordinate,
              :empty,
              :ships,
              :fired_upon

  def initialize(cell_coordinate)
    @coordinate = cell_coordinate
    # cell_coordinate instead of cell_number
    @empty = true
    @ships = []
    # Mentor had something to say about this being an array... we should look
    # into it
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

  # def coordinate
  #   cell_number
  # end
  # coordinate switched to attr_reader

  def ship
    if @empty == true
      nil
    else
      @ships[0]
      # might not work later in Iteration 2
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
