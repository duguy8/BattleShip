 require 'minitest/autorun'
 require 'minitest/pride'
 require './lib/ship'

 class ShipTest < Minitest::Test
   def test_it_exists
     cruiser = Ship.new("Cruiser", 3)
     assert_instance_of Ship, cruiser
  end

  def test_ship_has_health
    # skip
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

  def test_has_not_sunk
    # skip
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
  end

  def test_ship_loses_health_after_hit
    # skip
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal false, cruiser.sunk?
    assert_equal 2, cruiser.health
  end

  def test_ship_sinks_after_being_hit_3_times
    # skip
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
  assert_equal true, cruiser.sunk?
  end
end
