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
    # Mentor had something to say about this being an array... we should look
    # into it
    @fired_upon = false
  end

  def render(rendered = true)
    if @fired_upon == true && ship.health == 0
      "X"
    elsif @fired_upon == true && @ship != nil
      "H"
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == false
      "."
    end
  end

  def fire_upon
    #require 'pry'; binding.pry
    #if @fired_upon == true
    if @ship != nil
      @fired_upon = true
      ship.hit
    else
      @fired_upon
    end
    # else
    # end
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

  # def ship
  #   if @empty == true
  #     nil
  #   else
  #     @ship[0]
  #     # might not work later in Iteration 2
  #   end

  def empty?
    empty
  end

  def place_ship(cruiser)
    @ship = cruiser
    not_empty
  end
end
