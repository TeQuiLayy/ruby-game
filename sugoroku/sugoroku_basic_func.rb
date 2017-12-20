require "io/console"

class SugorokuBasicFunc
  attr_accessor :players

  def count_players
    @players = []
    puts "何人でプレイしますか？"
    loop do
      @num_players = gets.chomp.to_i
      break if @num_players.to_s =~ /^[1-4]+$/
      puts "1〜4の半角数字を入力してください。"
    end
  end

  def entry_players
    ii = 1
    while ii <= @num_players
      puts "#{ii}人目の名前を入力してください。"
      @players << SugorokuPlayer.new(gets.chomp)
      ii += 1
    end
  end

  def play
    @players.each do |player|
      unless player.finish_flg
        player.play
        player.display_result
      end
    end
  end
end
