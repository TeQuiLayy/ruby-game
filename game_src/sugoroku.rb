require "io/console"

class Player
  attr_accessor :position, :rank
  attr_reader   :id, :name, goal

  def initialize(id, name)
    @id = id
    @name = name
    @position = 0
    @rank = 0
    @goal = false
  end
end

#すごろくのメイン関数
def sugoroku_main
  players = []

  sugoroku_entry(players)

  turn = 0
  while turn < 6
    sugoroku_play(players, turn)
    turn += 1
    sugoroku_ranking(players)
  end

end

#すごろくプレイヤーの登録関数
def sugoroku_entry(players)
  puts "何人でプレイしますか？"
  players_num = gets.chomp.to_i

  ii = 1
  while ii <= players_num
    puts "#{ii}人目の名前を入力してください。"
    players << Player.new(ii, gets.chomp)
    ii += 1
  end
end

#すごろくプレイ関数
def sugoroku_play(players, turn)
  ii = 0

  while ii < players.size && players[ii].rank == 0
    puts "\n#{players[ii].name}さんの#{turn+1}ターン目です。\nサイコロを振ってください！"

    STDIN.getch
    dice = rand(1..6)
    players[ii].position += dice

    puts "#{dice}が出ました！\n現在#{players[ii].position}マス目です。"

    ii += 1

  end
end

def sugoroku_ranking(players)
  ii = 1
  rank = 1
  goal_position = 20
  goal_players = []

  while ii <= players.size
    if players[ii].position >= goal_position
      goal_players << players[ii]
      goal_players.rank = rank
      puts "#{goal_players.[ii].name}さんが、#{goal_players.rank}位でゴールしました！"
      rank += 1
    end
    ii += 1
  end
  #ゴールした順にインスタンス変数rankに順位を格納する
  #ゴールしたプレイヤーの順位を表示する


  #ゴールに到達していないプレイヤーの位置を比較して順位をランキング配列に格納する
  #ゴールしていないプレイヤーの順位を表示する



  while ii < players.size

  if players[ii].position >=20
    rank += 1
    players[ii].rank = rank
    puts"ゴールしました！あなたの順位は#{players[ii].rank}着です。"
  end

  puts"現在、#{players[ii].name}さんが#{ii}位です。"
end

sugoroku_main
