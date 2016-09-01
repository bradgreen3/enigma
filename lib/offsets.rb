require 'Date'
require 'pry'
require_relative 'key_generator'

class Offsets
  attr_reader :date , :key , :offset_generator , :offset_calculator ,
              :offset , :rotations

  def offset_generator(date)
    if date == Date.today
      @date = date.to_s
      @date = @date.split("-")
      @date[0] = @date[0].slice(2..3)
      @date.rotate!
      @date[0], @date[1] = @date[1], @date[0]
      @date = @date.join("")
      offset = (@date.to_i * @date.to_i).to_s
      offset = offset[-4..-1]
      return offset
    elsif date.class != String
      return "Date must be a string"
    elsif date.length != 6
      return "Date must be in MMDDYY format"
    else
      offset = date
      offset = (offset.to_i * offset.to_i).to_s
      offset = offset[-4..-1]
      return offset
    end
  end


  def offset_calculator(date, key)
    @offset = offset_generator(date)
    @rotations = []
    @rotations << ((@offset[0].to_i + key[0..1].to_i) % 95)
    @rotations << ((@offset[1].to_i + key[1..2].to_i) % 95)
    @rotations << ((@offset[2].to_i + key[2..3].to_i) % 95)
    @rotations << ((@offset[3].to_i + key[3..4].to_i) % 95)
  end
end

# test = Offsets.new
# puts test.offset_calculator(Date.today)
