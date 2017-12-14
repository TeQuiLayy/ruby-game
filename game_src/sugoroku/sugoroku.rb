require "io/console"

class SugorokuPlayer
  attr_accessor :position, :goal_turn, :goal, :rank
  attr_reader :name

  def initialize(name)
    @name = name
    @position = 0
    @goal_turn = 0
    @goal = false
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
  attr_reader :goaled_players, :not_goaled_players

  def initialize
    @dice = Dice.new(6)
    @rank = 1
    @turn = 1
  end

  def entry
    @players = []
    puts "何人でプレイしますか？"
    player_num = gets.chomp.to_i

    ii = 1
    while ii <= player_num
      puts "#{ii}人目の名前を入力してください。"
      @players << SugorokuPlayer.new(gets.chomp)
      ii += 1
    end
  end

  def play
    @players.each do |player|
      unless player.goal
        puts "\n#{player.name}さんの番です。\nサイコロを振ってください！"
        STDIN.getch
        outcome = @dice.roll
        player.position += outcome
        puts "\n#{outcome}が出ました！ #{player.name}さんは、現在#{player.position}マス目です"
      end
    end
  end

  def check_each_players_goaled
    @players.each do |player|
      if (player.goal == false)&&(player.position >= 20)
        player.goal = true
        player.goal_turn = @turn
      end
    end
  end

  def screening_goaled_players
    @goaled_players = @players.select {|player| player.goal == true}
    @not_goaled_players = @players.select {|player| player.goal == false}
  end

  def everybody_goaled?
    game_over = true
    game_over = @players.inject(true){|result, player| result && player.goal}
  end
end

class Ranking
  def make_goaled_player_ranking(goaled_players)
    goaled_players.each do |player|
      if player
        player.rank = 1
        goaled_players.each do |compare_player|
          if player.goal_turn > compare_player.goal_turn
            player.rank += 1
          end
        end
      end
    end
    goaled_players.sort_by!{|player| player.rank}
  end

  def make_not_goaled_player_ranking(not_goaled_players, goaled_players_size)
    not_goaled_players.each do |player|
      player.rank = goaled_players_size + 1
      not_goaled_players.each do |compare_player|
        if player.position < compare_player.position
          player.rank += 1
        end
      end
    end
    not_goaled_players.sort_by!{|player| player.rank}
  end

  def display_ranking(goaled_players, not_goaled_players)
    ii = 0
    while ii < goaled_players.size
      puts "#{goaled_players[ii].rank}位でゴールしたのは、#{goaled_players[ii].name}さんです。"
      ii += 1
    end
    jj = 0
    while jj < not_goaled_players.size
      puts "現在#{not_goaled_players[jj].rank}位は、#{not_goaled_players[jj].name}さんです。"
      jj += 1
    end
  end
end

sugoroku = Sugoroku.new
ranking = Ranking.new
sugoroku.entry
until sugoroku.everybody_goaled?
  sugoroku.play
  sugoroku.check_each_players_goaled
  sugoroku.screening_goaled_players
  ranking.make_goal_player_ranking(sugoroku.goaled_players)
  ranking.make_not_goal_player_ranking(sugoroku.not_goaled_players, sugoroku.goaled_players.size)
  ranking.display_ranking(sugoroku.goaled_players, sugoroku.not_goaled_players)
  sugoroku.turn += 1
end
