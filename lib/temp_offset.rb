require 'Date'
require 'pry'

class Offsets
  attr_reader :key, :date


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

  def key_to_base_offset(key) #must be string
    skip
    a = (key[0] + key[1]).to_i
    b = (key[1] + key[2]).to_i
    c = (key[2] + key[3]).to_i
    d = (key[2] + key[4]).to_i
  end


end

test = Offsets.new
puts test.offset_generator('01201990')

  # offset_calculator
  #   generates A B C D rotations
  #   A = first & second of key + fist of offset
  #   B = second & third of key + second of offset
  #   C = third & fourth of key + third of offset
  #   D = fourth & fifth of key + fourth of offset
