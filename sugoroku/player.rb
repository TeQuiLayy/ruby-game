class Player
  attr_accessor :rank
  attr_reader :name

  def initialize(name)
    @name = name
    @rank = 0
  end

  def get_point
    point = 0
  end
end
