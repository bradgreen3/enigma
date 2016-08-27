require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator.rb'

class KeyGeneratorTest < Minitest::Test
  def test_initialize_with_number_array
    key_gen = KeyGenerator.new

    assert_equal [0,1,2,3,4,5,6,7,8,9], key_gen.numbers
  end

  def test_initialize_with_empty_key_array
    key_gen = KeyGenerator.new

    assert_equal [], key_gen.key
  end

  def test_numbers_shuffle
    key_gen = KeyGenerator.new

    assert key_gen.shuffle.length == key_gen.numbers.length
    refute key_gen.shuffle == key_gen.numbers
  end

end
