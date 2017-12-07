require "io/console"

class Player
  attr_accessor :position, :rank
  attr_reader   :name, :goal, :goal_turn

  def initialize(name)
    @name = name
    @dice = 0
    @position = 0
    @goal = false
    @goal_turn = 0
    @rank = 1
  end

  def roll(turn)
    STDIN.getch
    @dice = rand(1..6)
    @position += @dice
    if @position >= 20
      puts "おめでとうございます！ #{@name}さんがゴールしました！"
      @goal = true
      @goal_turn = turn
    else
      puts "#{@dice}が出ました！\n現在#{@position}マス目です。"
    end
  end
end

#すごろくのメインメソッド
def sugoroku_main
  players = []

  sugoroku_entry(players)

  sugoroku_play(players)

end

#すごろくプレイヤーの登録メソッド
def sugoroku_entry(players)
  puts "何人でプレイしますか？"
  players_num = gets.chomp.to_i

  ii = 1
  while ii <= players_num
    puts "#{ii}人目の名前を入力してください。"
    players << Player.new(gets.chomp)
    ii += 1
  end
end

#すごろくプレイメソッド
def sugoroku_play(players)
  turn = 1
  while true
    ii = 0
    while ii < players.size && players[ii].goal == false
      puts "\n#{players[ii].name}さんの#{turn}ターン目です。\nサイコロを振ってください！"

      players[ii].roll(turn)
      ii += 1
    end
    turn +=1
    game_end = players.inject(true){|result, goal| result && goal}
    break if game_end == true
  end
end

def sugoroku_rank(players)
  ii = 0
  jj = 0
  kk = 0
  while ii < players.size
    jj = ii + 1
    while jj < players.size
      if players[ii].goal_turn > players[jj].goal_turn
        players[ii].rank += 1
      elsif players[ii].goal_turn < players[jj].goal_turn
        players[jj].rank += 1
      end
    end
  end

  while kk < players.size
    puts "#{players[kk].name}, #{players[kk].rank}"
  end
end

sugoroku_main
