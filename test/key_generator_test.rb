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

  def test_sample_to_key_array
    key_gen = KeyGenerator.new
    key_gen.get_key

    assert_equal 5, key_gen.key.length
  end

  def test_that_it_returns_key
    key_gen = KeyGenerator.new
    key_gen.give_key

    assert_equal 5, key_gen.give_key.length
  end
end
