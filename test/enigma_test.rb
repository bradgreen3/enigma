require './lib/enigma'
require_relative 'test_helper'



class EnigmaTest < Minitest::Test
  def test_encrypt_with_message_input
    e = Enigma.new
    e.encrypt('hello', '12345', Date.today)

    assert_equal 'hello', e.message
    assert_equal '12345', e.key
    assert_equal Date.today, e.date
  end

  def test_default_values
    e = Enigma.new
    e.encrypt('hello', '12345')

    assert_equal Date.today, e.date

    e.encrypt('hello', '12345')

    assert_equal Date.today, e.date
  end

  def test_default_key
    e = Enigma.new
    e.encrypt('hello')

    assert_equal Date.today, e.date
    assert_equal String, e.key.class
    assert_equal 5, e.key.length
  end

  def test_message_gets_broken_up
    e = Enigma.new
    e.encrypt('hello')

    assert_equal Array, e.prepare_message.class
    assert_equal ['h','e','l','l','o'], e.prepare_message
  end

  def test_get_offsets_hits_cipher_and_returns_it
    e = Enigma.new
    e.encrypt('hello', '12345', '051185')

    assert_equal Hash, e.ciphers.class
  end


end
