require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < MiniTest::Test

  def test_it_exists
    cell1=Cell.new("A1")
    assert_instance_of Cell, cell1
  end
end
