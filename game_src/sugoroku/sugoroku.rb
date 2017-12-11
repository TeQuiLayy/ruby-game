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
  attr_reader :players, :player_num#, :iterator

  def initialize
    @players = []
    puts "何人でプレイしますか？"
    @player_num = gets.chomp.to_i
    #@iterator = PlayerListIterator.new(self)
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

class PlayerListIterator
  def initialize(players)
    @players = players
    @index = 0
  end

  def hasNext?
    if (@index < @players.player_num)
      true
    else
      false
    end
  end

  def next
    player = @players.players[@index]
    @index += 1
    player
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
    #it = @players.iterator
    it = PlayerListIterator.new(@players)
    while it.hasNext?
      player = it.next
      puts "\n#{player.name}さんの番です。\nサイコロを振ってください！"
      STDIN.getch
      player.play
      puts "\n#{player.outcome}が出ました！ #{player.name}さんは、現在#{player.position}マス目です"
    end
  end

  def goal_judge?
    #it = @players.iterator
    while it.hasNext?
      player = it.next
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
