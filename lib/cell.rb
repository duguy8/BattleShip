class Cell
  attr_reader :coordinate,
              :empty,
              :fired_upon,
              :ship

  # attr_accessor :ship

  def initialize(cell_coordinate)
    @coordinate = cell_coordinate
    @empty = true
    @ship = ship
    @fired_upon = false
  end

  def render(rendered = true)
    if @fired_upon == true && @ship == nil
      " M"
    elsif @fired_upon == true && @ship.sunk?
      " X"
    elsif @fired_upon == true && @ship != nil
      " H"
    elsif @empty == false
      " S"
    else
      " ."
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

  def place_ship(ship_name)
    not_empty
    @ship = ship_name
  end
end
