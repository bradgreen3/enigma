require_relative 'test_helper'
require './lib/offsets.rb'

class OffsetsTest < Minitest::Test
  def test_offset_generator_converts_date_class_to_string
    offset = Offsets.new
    offset.offset_generator(Date.today)
    assert_equal String , (offset.offset_generator(Date.today)).class
  end

  def test_offset_generator_removes_dashes_from_date_class
    offset = Offsets.new
    refute_includes(offset.offset_generator(Date.today), "-")
  end

  def test_offset_generator_returns_last_four_of_squared_date_class
    offset = Offsets.new
    assert_equal 4 , offset.offset_generator(Date.today).length
  end

  def test_offset_generator_refuses_non_string_argument
    offset = Offsets.new
    assert_equal "Date must be a string" , offset.offset_generator(82816)
  end

  def test_offset_generator_only_accepts_six_chars
    offset = Offsets.new
    assert_equal "Date must be in MMDDYY format" , offset.offset_generator("82816")
  end

  def test_offset_generator_squares_user_supplied_date
    offset = Offsets.new
    assert_equal "9856" , offset.offset_generator("082816")
  end

  def test_offset_calculator_accepts_offset_from_generator
    off_and_key = Offsets.new
    off_and_key.offset_calculator("082816", '12345')
    assert_equal "9856" , off_and_key.offset
  end

  def test_offset_calculator_generates_rotations
   off_and_key = Offsets.new
   off_and_key.offset_calculator("082816", '12345')
   assert off_and_key.rotations
  end
 end
