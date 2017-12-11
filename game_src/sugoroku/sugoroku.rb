class Player
  attr_accessor :rank
  attr_reader :name

  def initialize(name)
    @name = name
    @position = 0
    @rank = 0
  end

  def play
    dice = Dice.new(6)
    @position += dice.roll
  end
end

class Dice
  attr_reader :sides

  def initialize(sides)
    @sides = Range.new(1, sides)
  end

  def roll
    rand(@sides)
  end
end

class PlayerList
  attr_reader :players

  def initialize
    puts "何人でプレイしますか？"
    @player_num = gets.chomp.to_i
    @players = []
    ii = 0

    while ii < @player_num
      puts "#{ii}人目の名前を入力してください。"
      @players << Player.new(gets.chomp)
      ii += 1
    end
  end

  def ranking
  end
end

class Display
  def at_present(Player)

  end
end

class Main
  def initialize
    
  end
end
