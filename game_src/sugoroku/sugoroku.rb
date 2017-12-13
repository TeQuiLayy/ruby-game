require "io/console"

class SugorokuPlayer
  attr_accessor :position, :rank, :goal
  attr_reader :name

  def initialize(name)
    @name = name
    @position = 0
    @rank = 0
    @goal = false
  end
end

class Dice
  attr_reader :outcome

  def initialize(sides)
    @sides = Range.new(1, sides)
    @outcome = 0
  end

  def roll
    @outcome = rand(@sides)
  end
end

class Ranking
  def initialize
    @ranking = []
  end
  def make_ranking(players)
    @ranking = players.sort_by{|player| player.position}.reverse
    @ranking.each_with_index{|player, idx| player.rank = idx + 1}
  end
  def display_ranking
    ii = 0
    while ii < @ranking.size
      puts "現在#{@ranking[ii].rank}位は、#{@ranking[ii].name}さんです。"
      ii += 1
    end
  end
end

class Sugoroku
  attr_accessor :players

  def initialize
    @dice = Dice.new(6)
    @rank = 1
    @ranking = []
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
        @outcome = @dice.roll
        player.position += @outcome
        puts "\n#{@outcome}が出ました！ #{player.name}さんは、現在#{player.position}マス目です"
      end
    end
  end

  def finished?
    @players.each do |player|
      if (player.goal == false)&&(player.position >= 20)
        player.goal = true
      end
    end
  end

  def everybody_finished?
    game_over = false
    game_over = @players.inject(true){|result, player| result && player.goal}
  end
end

sugoroku = Sugoroku.new
ranking = Ranking.new
sugoroku.entry
until sugoroku.everybody_finished?
  sugoroku.play
  ranking.make_ranking(sugoroku.players)
  ranking.display_ranking
end
