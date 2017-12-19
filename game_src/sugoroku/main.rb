require_relative "./sugoroku.rb"
require_relative "./sugoroku_player.rb"
require_relative "./dice.rb"
require_relative "./ranking.rb"
require_relative "./judge.rb"

sugoroku = Sugoroku.new
ranking = Ranking.new
judge = Judge.new
sugoroku.count_player
sugoroku.entry
until judge.everybody_finished?(sugoroku.players)
  sugoroku.play
  judge.check_each_players_finished(sugoroku.players)
  judge.screening_finished_players(sugoroku.players)
  ranking.make_ranking_of_finished_player(judge.finished_players)
  ranking.make_ranking_of_unfinished_player(judge.unfinished_players, judge.finished_players.size)
  ranking.display_ranking(judge.finished_players, judge.unfinished_players)
  judge.turn += 1
end
