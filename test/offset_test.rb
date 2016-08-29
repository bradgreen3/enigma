require_relative 'test_helper'
require './lib/offset.rb'

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

  def test_make_rotations_hash
    offset = Offsets.new
    sample = [1,2,3,4]

    assert_equal Hash, offset.make_rotation_hash(sample).class
  end

  def test_base_returns_hash
    offset = Offsets.new

    assert_equal Array, offset.base('12345').class
    assert_equal 12, offset.base('12345')[0]
    assert_equal 23, offset.base('12345')[1]
    assert_equal 34, offset.base('12345')[2]
    assert_equal 45, offset.base('12345')[3]
  end

  def test_offset_rotations #test needs to be updated daily
    offset = Offsets.new
    date = offset.offset_generator(Date.today)

    assert_equal Array, offset.offset(date).class
    assert_equal 3, offset.offset(date)[0]
    assert_equal 0, offset.offset(date)[1]
    assert_equal 5, offset.offset(date)[2]
    assert_equal 6, offset.offset(date)[3]
  end

  def test_rotations_summed #test needs to be updated daily
    offset = Offsets.new
    date = offset.offset_generator(Date.today)
    assert_equal Array, offset.rotations('12345', date).class
    assert_equal 12 + 3, offset.rotations('12345', date)[0]
    assert_equal 23 + 0, offset.rotations('12345', date)[1]
    assert_equal (34 + 5) % 26, offset.rotations('12345', date)[2]
    assert_equal (45 + 6) % 26, offset.rotations('12345', date)[3]
  end

  def test_final_hashes
    offset = Offsets.new
    date = offset.offset_generator(Date.today)

    assert_equal Hash, offset.final_hashes('12345', date).class
  end
end
