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
    assert_equal "B4", cell.coordinate
  end

  def test_ship_is_nil
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_nil cell.ship
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

  def test_if_ship_has_been_fired_upon_false
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.fired_upon?
  end

  def test_if_ship_has_been_fired_upon_true
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_cell_1_render
    cell_1 = Cell.new("B4")
    assert_equal " .", cell_1.render
  end

  def test_cell_1_render_after_fired_upon
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    assert_equal " M", cell_1.render
  end

  def test_place_ship_and_render_cell_2
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    assert_equal " S", cell_2.render(true)
  end

  def test_place_ship_and_render_cell_2_after_fired_upon
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    cell_2.render(true)
    cell_2.fire_upon
    assert_equal " H", cell_2.render
  end

  def test_ship_has_not_sunk
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    cell_2.render(true)
    cell_2.fire_upon
    cell_2.render
    assert_equal false, cruiser.sunk?
  end

  def test_ship_sinks_and_get_an_X
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render
    cell_2.render(true)
    cell_2.fire_upon
    cell_2.render
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
    assert_equal " X", cell_2.render
  end
end
