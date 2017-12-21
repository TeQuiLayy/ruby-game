require_relative "./ranking.rb"

class SugorokuRanking < Ranking
  def make_ranking_of_finished_player(finished_players)
    make_ascending_ranking(finished_players, 1)
  end

  def make_ranking_of_unfinished_player(unfinished_players, finished_players_size)
    make_descending_ranking(unfinished_players, finished_players_size + 1)
  end

  def display_ranking(finished_players, unfinished_players)
    puts "\n"
    ii = 0
    while ii < finished_players.size
      puts "#{finished_players[ii].rank}位でゴールしたのは、#{finished_players[ii].name}さんです。"
      ii += 1
    end
    jj = 0
    while jj < unfinished_players.size
      puts "現在#{unfinished_players[jj].rank}位は、#{unfinished_players[jj].name}さんです。"
      jj += 1
    end
  end
end
