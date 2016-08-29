require_relative 'test_helper'
require './lib/offset.rb'

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

  def test_offset_rotations
    offset = Offsets.new
    date = offset.offset_generator(Date.today)

    assert_equal Array, offset.offset(date).class
    assert_equal 4, offset.offset(date)[0]
    assert_equal 2, offset.offset(date)[1]
    assert_equal 5, offset.offset(date)[2]
    assert_equal 6, offset.offset(date)[3]
  end

  def test_rotations_summed
    offset = Offsets.new
    date = offset.offset_generator(Date.today)

    assert_equal Array, offset.rotations('12345', date).class
    assert_equal 12 + 4, offset.rotations('12345', date)[0]
    assert_equal 23 + 2, offset.rotations('12345', date)[1]
    assert_equal (34 + 5) % 26, offset.rotations('12345', date)[2]
    assert_equal (45 + 6) % 26, offset.rotations('12345', date)[3]
  end

  def test_final_hashes
    offset = Offsets.new
    date = offset.offset_generator(Date.today)

    assert_equal Hash, offset.final_hashes('12345', date).class
  end
end
