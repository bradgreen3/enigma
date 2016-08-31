require_relative 'test_helper'
require './lib/enigma'



class EnigmaTest < Minitest::Test
  def test_encrypt_with_message_input
    e = Enigma.new
    e.encrypt('hello', '12345', Date.today)

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

  def test_get_offsets_hits_cipher_and_returns_it
    e = Enigma.new
    e.encrypt('hello', '12345', '051185')

    assert_equal Hash, e.ciphers.class
  end

  def test_encrypt_works
    e = Enigma.new

    assert_equal 'x~1? ', e.encrypt('hello', '12345', '051185')
    assert_equal '|}/:$' , e.encrypt('hello', '12345', '012090')
  end

  def test_encrypt_hello_decrypt_hello
    e = Enigma.new
    encrypted = e.encrypt('hello', '12345', '051185')
    decrypted = e.decrypt(encrypted, '12345', '051185')

    assert_equal 'hello', decrypted
    assert_equal 'x~1? ', encrypted
  end

  def test_crack_exists
skip
    e = Enigma.new
    result = e.crack("-|0S-|0S-|0S-|0SCI-ByIU", Date.today)

    assert_equal 'wah wah wah wah ..end..', result
  end
end
