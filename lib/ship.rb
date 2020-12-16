class Ship
  attr_reader :name,
              :length,
              :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def hit
    # if @health == 0
    #   @health
    # else
      @health -= 1
    # end
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end
end
