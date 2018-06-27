require "io/console"
require "./sugoroku_player"

class SugorokuBasicFunc
  attr_accessor :players

  def initialize
    @players = []
  end

  def count_players
    input_num_players
    @players = Array.new(@num_players)
  end

  def entry_players
    @players.each_index do |ii|
      puts "#{ii+1}人目の名前を入力してください。"
      @players[ii] = SugorokuPlayer.new(gets.chomp)
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

  private
  def input_num_players
    puts "何人でプレイしますか？"
    loop do
      @num_players = gets.chomp.to_i
      break if @num_players.to_s =~ /^[1-4]+$/
      puts "1〜4の半角数字を入力してください。"
    end
  end
end
