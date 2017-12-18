class SugorokuPlayer
  attr_accessor :position, :finish_turn, :finish_flg, :rank
  attr_reader :name

  def initialize(name)
    @name = name
    @position = 0
    @finish_turn = 0
    @finish_flg = false
    @rank = 0
  end
end
