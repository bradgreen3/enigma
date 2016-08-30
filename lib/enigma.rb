require_relative 'offsets'
require_relative 'key_generator'

class Enigma
  attr_reader :message, :key, :date , :generate_key, :ciphers

  def encrypt(input_message, input_key=generate_key, input_date=Date.today)
    @message = input_message
    @key = input_key
    @date = input_date
    @ciphers = get_offsets
    characters = prepare_message
    encrypted = []
    characters.each_with_index do |letter, index|
      if (index + 1) % 4 == 1
        encrypted << ciphers['A'][letter]
      elsif (index + 1) % 4 == 2
        encrypted << ciphers['B'][letter]
      elsif (index + 1) % 4 == 3
        encrypted << ciphers['C'][letter]
      else (index + 1) % 4 == 4
        encrypted << ciphers['D'][letter]
      end
    end
    encrypted.join
  end

  def generate_key
    key_gen = KeyGenerator.new
    key_gen.get_key
    @key = key_gen.give_key
  end

  def get_offsets
    date = @date
    key = @key
    o = Offsets.new
    rotations = o.offset_calculator(date, key)
    cipher(rotations)
  end

  def prepare_message
    text = @message
    text = text.chars
  end

  def cipher(rotations)
    alpha_library = ('a'..'z').to_a
    rotation_keys = ['A','B','C','D']
    rotations_hash = Hash[rotation_keys.zip(rotations)]
    rotations_hash['A'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['A']))]
    rotations_hash['B'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['B']))]
    rotations_hash['C'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['C']))]
    rotations_hash['D'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['D']))]
    rotations_hash
  end

end

e = Enigma.new
p e.encrypt('helloworld')
