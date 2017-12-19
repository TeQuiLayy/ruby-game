class Judge
  attr_accessor :turn
  attr_reader :finished_players, :unfinished_players

  def initialize
    @turn = 1
  end

  def check_each_players_finished(players)
    players.each do |player|
      player.check_player_finished(@turn)
    end
  end

  def screening_finished_players(players)
    @finished_players = players.select {|player| player.finish_flg == true}
    @unfinished_players = players.select {|player| player.finish_flg == false}
  end

  def everybody_finished?(players)
    game_over = true
    game_over = players.inject(true){|result, player| result && player.finish_flg}
  end
end
