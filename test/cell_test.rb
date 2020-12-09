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

  def test_empty?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal true, cell.empty?
  end

  def test_ship_is_placed
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
    assert_equal cruiser, cell.ship
  end
end
