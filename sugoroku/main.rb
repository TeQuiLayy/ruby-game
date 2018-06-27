require_relative "./sugoroku_basic_func.rb"
require_relative "./sugoroku_player.rb"
require_relative "./sugoroku_ranking.rb"
require_relative "./judge.rb"

sugoroku = SugorokuBasicFunc.new
ranking = SugorokuRanking.new
judge = Judge.new

#すごろくプレイヤーの登録
sugoroku.count_players
sugoroku.entry_players

#全員がゴールするまでループ
until judge.everybody_finished?(sugoroku.players)
  #サイコロを振って駒を進める
  sugoroku.play

  #ゴールしたプレイヤーとしていないプレイヤーを分ける
  judge.check_each_players_finished(sugoroku.players)
  judge.screening_finished_players(sugoroku.players)

  #ゴールしたプレイヤーとしていないプレイヤーのランキングを算出して表示
  ranking.make_ranking_of_finished_player(judge.finished_players)
  ranking.make_ranking_of_unfinished_player(judge.unfinished_players)
  ranking.display_ranking_all_players(judge.finished_players, judge.unfinished_players)

  #ターンを加算
  judge.turn += 1
end
