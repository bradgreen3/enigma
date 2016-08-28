require_relative 'test_helper'

require './lib/temp_offset.rb'

class OffsetsTest < Minitest::Test
  def test_offset_generator_converts_date_to_string
    offset = Offsets.new
    offset.offset_generator(Date.today)
    assert_equal String , offset.date.class
  end

  def test_offset_generator_removes_dashes_from_date
    offset = Offsets.new
    offset.offset_generator(Date.today)
    refute_includes(offset.date, "-")
  end

  def test_offset_generator_returns_last_four_of_squared_date
    offset = Offsets.new
    offset.offset_generator(Date.today)
    assert_equal 4 , offset.date.length
  end

  #beginning of my bullshit
  # def test_
end
