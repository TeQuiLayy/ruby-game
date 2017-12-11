require "io/console"

class SugorokuPlayer
  attr_accessor :rank, :goal
  attr_reader :name, :outcome, :position

  def initialize(name)
    @name = name
    @position = 0
    @rank = 0
    @goal = false
    @dice = Dice.new(6)
    @outcome = 0
  end

  def play
    @outcome = @dice.roll
    @position += @outcome
  end
end

class PlayerList
  attr_reader :players, :player_num

  def initialize
    @players = []
    puts "何人でプレイしますか？"
    @player_num = gets.chomp.to_i
  end

  def naming
    ii = 1
    while ii <= @player_num
      puts "#{ii}人目の名前を入力してください。"
      @players << SugorokuPlayer.new(gets.chomp)
      ii += 1
    end
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

class Sugoroku_main
  def entry
    @players = PlayerList.new
    @players.naming
  end

  def play
    @players.players.each do |player|
      puts "\n#{player.name}さんの番です。\nサイコロを振ってください！"
      STDIN.getch
      player.play
      puts "\n#{player.outcome}が出ました！ #{player.name}さんは、現在#{player.position}マス目です"
    end
  end

  def goal_judge?
    @players.players.each do |player|
      if (player.position >= 20)
        player.goal = true
      end
    end
  end

  def make_ranking
    it = @players.iterator
    while it.hasNext?
      player = it.next
    end
  end
end

sugoroku = Sugoroku_main.new
sugoroku.entry
sugoroku.play
sugoroku.play
sugoroku.play
