require 'Date'

{"A"=>{"a"=>"s", "b"=>"t", "c"=>"u", "d"=>"v", "e"=>"w", "f"=>"x", "g"=>"y", "h"=>"z", "i"=>"a", "j"=>"b", "k"=>"c", "l"=>"d", "m"=>"e", "n"=>"f", "o"=>"g", "p"=>"h", "q"=>"i", "r"=>"j", "s"=>"k", "t"=>"l", "u"=>"m", "v"=>"n", "w"=>"o", "x"=>"p", "y"=>"q", "z"=>"r"}, "B"=>{"a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m", "g"=>"n", "h"=>"o", "i"=>"p", "j"=>"q", "k"=>"r", "l"=>"s", "m"=>"t", "n"=>"u", "o"=>"v", "p"=>"w", "q"=>"x", "r"=>"y", "s"=>"z", "t"=>"a", "u"=>"b", "v"=>"c", "w"=>"d", "x"=>"e", "y"=>"f", "z"=>"g"}, "C"=>{"a"=>"r", "b"=>"s", "c"=>"t", "d"=>"u", "e"=>"v", "f"=>"w", "g"=>"x", "h"=>"y", "i"=>"z", "j"=>"a", "k"=>"b", "l"=>"c", "m"=>"d", "n"=>"e", "o"=>"f", "p"=>"g", "q"=>"h", "r"=>"i", "s"=>"j", "t"=>"k", "u"=>"l", "v"=>"m", "w"=>"n", "x"=>"o", "y"=>"p", "z"=>"q"}, "D"=>{"a"=>"j", "b"=>"k", "c"=>"l", "d"=>"m", "e"=>"n", "f"=>"o", "g"=>"p", "h"=>"q", "i"=>"r", "j"=>"s", "k"=>"t", "l"=>"u", "m"=>"v", "n"=>"w", "o"=>"x", "p"=>"y", "q"=>"z", "r"=>"a", "s"=>"b", "t"=>"c", "u"=>"d", "v"=>"e", "w"=>"f", "x"=>"g", "y"=>"h", "z"=>"i"}}

date = date.to_s
date = date.split("-")
date[0] = date[0].slice(2..3)
date.rotate!
date[0], date[1] = date[1], date[0]
date = date.join("")
date = (date.to_i * date.to_i).to_s
date = date[-4..-1]







def make_rotation_hash(array)
  rotation_keys = ['A','B','C','D']
  # rotation_vals = [a,b,c,d]
  zipped = rotation_keys.zip(array)
  rotations = Hash[zipped]
end


rotation_keys = ['A', 'B', 'C', 'D']
rotations_hash = rotation_keys.zip()
rotations_hash['A'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['A']))]
rotations_hash['B'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['B']))]
rotations_hash['C'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['C']))]
rotations_hash['D'] = Hash[alpha_library.zip(alpha_library.rotate(rotations_hash['D']))]
rotations_hash


















# class Offsets
#   attr_reader :make_rotation_hash, :offset_generator
#   def offset_generator(date)
#     @date = date.to_s
#     @date = @date.split("-")
#     @date.rotate!(1)
#     # require "pry"; binding.pry
#     @date[2].slice!(0,2)
#     @date = @date.join("")
#     @date = (@date.to_i * @date.to_i).to_s
#     @date = @date[-4..-1]
#   end
#
#   puts offset_generator(Date.today).inspect


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
