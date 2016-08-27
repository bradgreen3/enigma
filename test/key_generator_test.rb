require_relative 'test_helper.rb'
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

  def test_numbers_plucked_from_array
    key_gen = KeyGenerator.new
    key_gen_shuffled = key_gen.shuffle
  require "pry"; binding.pry
#I want this test to demand the existence of a five member array
#that has been plucked every-other from the shuffled array
    assert_equal 5, key_gen.key_array.key.length
  end

end
