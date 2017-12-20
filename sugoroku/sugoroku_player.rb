class SugorokuPlayer
  attr_accessor :position, :finish_turn, :finish_flg, :rank
  attr_reader :name

  def initialize(name)
    @name = name
    @position = 0
    @finish_turn = 0
    @finish_flg = false
    @rank = 0
    @dice = Dice.new(6)
  end

  def play
    unless @finish_flg
      puts "\n#{@name}さんの番です。\nサイコロを振ってください！"
      STDIN.getch
      outcome = @dice.roll
      @position += outcome
      if @position >= 20
        puts "\n#{outcome}が出ました！ #{@name}さんは、ゴールしました！"
      else
        puts "\n#{outcome}が出ました！ #{@name}さんは、現在#{@position}マス目です"
      end
    end
  end

  def check_player_finished(turn)
    if (@finish_flg == false)&&(@position >= 20)
      @finish_flg = true
      @finish_turn = turn
    end
  end
end
