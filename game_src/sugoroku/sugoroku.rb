require "io/console"

class Sugoroku
  attr_accessor :players

  def count_player
    @players = []
    puts "何人でプレイしますか？"
    loop do
      @num_players = gets.chomp.to_i
      break if @num_players.to_s =~ /^[1-4]+$/
      puts "1〜4の半角数字を入力してください。"
    end
  end

  def entry
    ii = 1
    while ii <= @num_players
      puts "#{ii}人目の名前を入力してください。"
      @players << SugorokuPlayer.new(gets.chomp)
      ii += 1
    end
  end

  def play
    @players.each do |player|
      player.play
    end
  end
end
