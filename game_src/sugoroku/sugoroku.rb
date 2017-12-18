require "io/console"

class Sugoroku
  attr_accessor :players, :turn
  attr_reader :finished_players, :unfinished_players

  def initialize
    @dice = Dice.new(6)
    @turn = 1
  end

  def player_count
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
    @unfinished_players = @players.select {|player| player.finish_flg == false}
  end

  def everybody_finished?
    game_over = true
    game_over = @players.inject(true){|result, player| result && player.finish_flg}
  end
end
