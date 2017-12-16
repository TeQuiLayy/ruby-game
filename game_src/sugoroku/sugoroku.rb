require "io/console"

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

class Dice
  def initialize(sides)
    @sides = Range.new(1, sides)
  end

  def roll
    outcome = rand(@sides)
  end
end

class Sugoroku
  attr_accessor :players, :turn
  attr_reader :finished_players, :not_finished_players

  def initialize
    @dice = Dice.new(6)
    @rank = 1
    @turn = 1
  end

  def player_count
    @players = []
    puts "何人でプレイしますか？"
    loop do
      @player_num = gets.chomp.to_i
      break if @player_num.to_s =~ /^[+-]?[0-9]+$/ && @player_num.between?(1, 4)
      puts "1〜4の半角数字を入力してください。"
    end
  end

  def entry
    ii = 1
    while ii <= @player_num
      puts "#{ii}人目の名前を入力してください。"
      @players << SugorokuPlayer.new(gets.chomp)
      ii += 1
    end
  end

  def play
    @players.each do |player|
      unless player.finish_flg
        puts "\n#{player.name}さんの番です。\nサイコロを振ってください！"
        STDIN.getch
        outcome = @dice.roll
        player.position += outcome
        puts "\n#{outcome}が出ました！ #{player.name}さんは、現在#{player.position}マス目です"
      end
    end
  end

  def check_each_players_finished
    @players.each do |player|
      if (player.finish_flg == false)&&(player.position >= 20)
        player.finish_flg = true
        player.finish_turn = @turn
      end
    end
  end

  def screening_finished_players
    @finished_players = @players.select {|player| player.finish_flg == true}
    @not_finished_players = @players.select {|player| player.finish_flg == false}
  end

  def everybody_finished?
    game_over = true
    game_over = @players.inject(true){|result, player| result && player.finish_flg}
  end
end

class Ranking
  def make_finished_player_ranking(finished_players)
    finished_players.each do |player|
      if player
        player.rank = 1
        finished_players.each do |compare_player|
          if player.finish_turn > compare_player.finish_turn
            player.rank += 1
          end
        end
      end
    end
    finished_players.sort_by!{|player| player.rank}
  end

  def make_not_finished_player_ranking(not_finished_players, finished_players_size)
    not_finished_players.each do |player|
      player.rank = finished_players_size + 1
      not_finished_players.each do |compare_player|
        if player.position < compare_player.position
          player.rank += 1
        end
      end
    end
    not_finished_players.sort_by!{|player| player.rank}
  end

  def display_ranking(finished_players, not_finished_players)
    ii = 0
    while ii < finished_players.size
      puts "#{finished_players[ii].rank}位でゴールしたのは、#{finished_players[ii].name}さんです。"
      ii += 1
    end
    jj = 0
    while jj < not_finished_players.size
      puts "現在#{not_finished_players[jj].rank}位は、#{not_finished_players[jj].name}さんです。"
      jj += 1
    end
  end
end

sugoroku = Sugoroku.new
ranking = Ranking.new
sugoroku.player_count
sugoroku.entry
until sugoroku.everybody_finished?
  sugoroku.play
  sugoroku.check_each_players_finished
  sugoroku.screening_finished_players
  ranking.make_finished_player_ranking(sugoroku.finished_players)
  ranking.make_not_finished_player_ranking(sugoroku.not_finished_players, sugoroku.finished_players.size)
  ranking.display_ranking(sugoroku.finished_players, sugoroku.not_finished_players)
  sugoroku.turn += 1
end
