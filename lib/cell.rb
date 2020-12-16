class Cell
  attr_reader :coordinate,
              :empty,
              :fired_upon,
              :ship
  def initialize(cell_coordinate)
    @coordinate = cell_coordinate
    @empty = true
    @ship = ship
    @fired_upon = false
  end

  def render(rendered = true)
    if empty == true && @fired_upon == true
      " M"
    elsif (@fired_upon == true && @ship.sunk?) && @ship.health <= 0
      " X"
    elsif empty == false && @fired_upon == true
      " H"
    elsif (empty == false && rendered == true) && @fired_upon == false
      " S"
    else
      " ."
    end
  end
  #
  #   if (@fired_upon == true && empty == true)
  #     " M"
  #   elsif (@fired_upon == true && @ship.health == 0)
  #     " X"
  #   elsif (@fired_upon == true && @ship.health > 0)
  #     " H"
  #   elsif (rendered == true && @fired_upon == false)
  #     " S"
  #   else
  #     " ."
  #   end
  # end

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
