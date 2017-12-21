require_relative "./sugoroku_basic_func.rb"
require_relative "./sugoroku_player.rb"
require_relative "./dice.rb"
require_relative "./sugoroku_ranking.rb"
require_relative "./judge.rb"

sugoroku = SugorokuBasicFunc.new
ranking = SugorokuRanking.new
judge = Judge.new
sugoroku.count_players
sugoroku.entry_players
until judge.everybody_finished?(sugoroku.players)
  sugoroku.play
  judge.check_each_players_finished(sugoroku.players)
  judge.screening_finished_players(sugoroku.players)
  ranking.make_ranking_of_finished_player(judge.finished_players)
  ranking.make_ranking_of_unfinished_player(judge.unfinished_players, judge.finished_players.size)
  ranking.display_ranking(judge.finished_players, judge.unfinished_players)
  judge.turn += 1
end
