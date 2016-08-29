require 'Date'
require 'pry'
require_relative 'key_generator'

class Offsets
  attr_reader :date , :key , :offset_generator , :offset_calculator ,
              :offset , :rotation_a , :rotation_b , :rotation_c ,
              :rotation_d , :rotations , :rotations_hash

  def offset_generator(date)
    if date == Date.today
      @date = date.to_s
      @date = @date.split("-")
      @date[0] = @date[0].slice(2..3)
      @date.rotate!(1)
      @date = @date.join("")
      @date = (@date.to_i * @date.to_i).to_s
      @date = @date[-4..-1]
      return @date
    elsif date.class != String
      return "Date must be a string"
    elsif date.length != 6
      return "Date must be in MMDDYY format"
    else
      @date = date
      @date = (@date.to_i * @date.to_i).to_s
      @date = @date[-4..-1]
      return @date
    end
  end


  def offset_calculator(date)
    @offset = offset_generator(date)
    @key = KeyGenerator.new
    @key.get_key
    @key = @key.give_key
    binding.pry
    @rotations = []
    @rotations << ((@offset[0].to_i + @key[0..1].to_i) % 26)
    @rotations << ((@offset[1].to_i + @key[1..2].to_i) % 26)
    @rotations << ((@offset[2].to_i + @key[2..3].to_i) % 26)
    @rotations << ((@offset[3].to_i + @key[3..4].to_i) % 26)
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

# test = Offsets.new
# puts test.offset_calculator(Date.today)
