class Cell
  attr_reader :coordinate,
              :empty,
              :ship,
              :fired_upon

  def initialize(cell_coordinate)
    @coordinate = cell_coordinate
    # cell_coordinate instead of cell_number
    @empty = true
    @ship = ship
    @fired_upon = false
  end

  def render(rendered = true)
    if @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship.sunk?
      "X"
    elsif @fired_upon == true && @ship != nil
      "H"
    elsif @empty == false
      "S"
    else
      "."
    end
  end

  def fire_upon
    @fired_upon = true
    if ship == nil
      @fired_upon
    else
      ship.hit
    end
  end

  def fired_upon?
    fired_upon
  end

  def not_empty
    @empty = false
  end

  def empty?
    empty
  end

  def place_ship(cruiser)
    @ship = cruiser
    not_empty
  end
end
