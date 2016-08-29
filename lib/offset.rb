require 'Date'

class Offsets
  attr_reader :key, :date, :alpha_library

  def initialize
    @alpha_library = ('a'..'z').to_a
  end


  def offset_generator(input_date)
    @date = input_date
    @date = date.to_s
    @date = @date.split("-")
    @date.rotate!(1)
    # @date[2].slice!(0,2)
    @date = @date.join("")
    @date = (@date.to_i * @date.to_i).to_s
    @date = @date[-4..-1]
  end

  def base(key)
    bases = [] #must be string
    bases << (key[0] + key[1]).to_i
    bases << (key[1] + key[2]).to_i
    bases << (key[2] + key[3]).to_i
    bases << (key[3] + key[4]).to_i
    bases
  end

  def offset(date)
    offsets = []
    offsets << date[0].to_i
    offsets << date[1].to_i
    offsets << date[2].to_i
    offsets << date[3].to_i
    offsets
  end

  def make_rotation_hash(array)
    rotation_keys = ['A','B','C','D']
    # rotation_vals = [a,b,c,d]
    zipped = rotation_keys.zip(array)
    rotations = Hash[zipped]
  end

  def rotations(key, date) #with the modulus
    bases = base(key)
    offsets = offset(date)
    summed = []

    bases.each_with_index do |number, index|
      summed << (number + offsets[index]) % 26
    end

    summed
  end

  def final_hashes(key, date)
    rotation_values = rotations(key, date)
    rotations_hash = make_rotation_hash(rotation_values)
    rotations_hash['A'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['A']))]
    rotations_hash['B'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['B']))]
    rotations_hash['C'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['C']))]
    rotations_hash['D'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['D']))]
    rotations_hash
  end

end
