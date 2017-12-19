require_relative "./sugoroku.rb"
require_relative "./sugoroku_player.rb"
require_relative "./dice.rb"
require_relative "./ranking.rb"

sugoroku = Sugoroku.new
ranking = Ranking.new
sugoroku.count_player
sugoroku.entry
until sugoroku.everybody_finished?
  sugoroku.play
  sugoroku.check_each_players_finished
  sugoroku.screening_finished_players
  ranking.make_ranking_of_finished_player(sugoroku.finished_players)
  ranking.make_ranking_of_unfinished_player(sugoroku.unfinished_players, sugoroku.finished_players.size)
  ranking.display_ranking(sugoroku.finished_players, sugoroku.unfinished_players)
  sugoroku.turn += 1
end
