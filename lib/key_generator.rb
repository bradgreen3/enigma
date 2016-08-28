class KeyGenerator
  attr_reader :numbers, :key
  def initialize
    @numbers = [0,1,2,3,4,5,6,7,8,9]
    @key = []
  end

  def get_key
    5.times { @key << @numbers.sample }
  end

  def give_key
    if @key.empty?
      self.get_key
    else
      @key.join
    end
  end

end
