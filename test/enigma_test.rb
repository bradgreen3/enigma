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
    e = Enigma.new
    result = e.crack("|in0|in0|in0|in036k~i64", "310816")
    assert_equal ['wah wah wah wah ..end..', '00010'], result

    result = e.crack("k}j.nvnBjvj5~x{2w4''t(!2zz'-tj(B36l1i65", '310816')
    assert_equal ["fucking encryptor, do your job! ..end..", '00028'], result
  end
end
