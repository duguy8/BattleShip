 require 'minitest/autorun'
 require 'minitest/pride'
 require '../lib/ship'

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

 def test_for_more_attributes
   skip
 assert_equal _, _
 end
end
