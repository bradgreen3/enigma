require 'Date'
class Offsets
  attr_reader :make_rotation_hash, :offset_generator
  def offset_generator(date)
    @date = date.to_s
    @date = @date.split("-")
    @date.rotate!(1)
    # require "pry"; binding.pry
    @date[2].slice!(0,2)
    @date = @date.join("")
    @date = (@date.to_i * @date.to_i).to_s
    @date = @date[-4..-1]
  end

  puts offset_generator(Date.today).inspect


  # # base rotations
  # @base_rotations = {}
  # def base_rotation_a(key)
  #   base_a = (key[0] + key[1]).to_i
  #   @base_rotations["a"] = base_a
  # end
  #
  # def base_rotation_b(key)
  #   base_b = (key[1] + key[2]).to_i
  #   @base_rotations["b"] = base_b
  # end
  #
  # def base_rotation_c(key)
  #   base_c = (key[2] + key[3]).to_i
  #   @base_rotations["c"] = base_c
  # end
  #
  # def base_rotation_d(key)
  #   base_d = (key[3] + key[4]).to_i
  #   @base_rotations["d"] = base_d
  # end


  def base_rotations(key) #must be string
    a = (key[0] + key[1]).to_i
    b = (key[1] + key[2]).to_i
    c = (key[2] + key[3]).to_i
    d = (key[3] + key[4]).to_i
    require "pry"; binding.pry
    make_rotation_hash(a,b,c,d)
    # base_rotation_keys = ['a','b','c','d']
    # base_rotation_vals = [a,b,c,d]
    # bases_zipped = base_rotation_keys.zip(base_rotation_vals)
    # base_rotations = Hash[bases_zipped]
    # puts base_rotations
  end
  puts base_rotations('12345')

  #offset_rotations
  def offset_rotations(date)
    a = date[0].to_i
    b = date[1].to_i
    c = date[2].to_i
    d = date[3].to_i
    make_rotation_hash(a,b,c,d)
    # offset_rotation_keys = ['a','b','c','d']
    # offset_rotation_vals = [a,b,c,d]
    # offset_zipped = offset_rotation_keys.zip(offset_rotation_vals)
    # offset_rotations = Hash[offset_zipped]
  end
  puts offset_rotations(offset_generator(Date.today))

  def make_rotation_hash(a,b,c,d)
    rotation_keys = ['a','b','c','d']
    rotation_vals = [a,b,c,d]
    zipped = rotation_keys.zip(rotation_vals)
    rotations = Hash[zipped]
  end

  # def offset_rotation_b(date)
  #   offset_b = date[1].to_i
  # end
  #
  #
  # def offset_rotation_c(date)
  #   offset_c = date[2].to_i
  # end
  #
  #
  # def offset_rotation_d(date)
  #   offset_d = date[3].to_i
  # end


  #final rotations


  def final_rotations
  end
end
