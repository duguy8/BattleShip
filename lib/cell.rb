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

  def render(rendered = true)
    if @fired_upon == true && @ships.length == 0
      "M"
    elsif @fired_upon == true && @ships.length == 1
      "H"
    elsif @ships.length == 1
      "S"
    else
      "."
    end
  end

  def fire_upon
    @fired_upon = true
    if @ships.length >= 1
      ship.hit
    else
    end
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
