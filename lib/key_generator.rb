class KeyGenerator
  attr_reader :numbers, :key
  def initialize
    @numbers = [0,1,2,3,4,5,6,7,8,9]
    @key = []
  end

  def shuffle
    shuffled = @numbers.shuffle
  end

end
