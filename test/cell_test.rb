require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def test_it_exists
    cell1=Cell.new("A1")
    assert_instance_of Cell, cell1
  end

  def test_you_can_place_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "B4", cell.coordinate
  end

  def test_ship_is_nil
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal nil, cell.ship
  end
end