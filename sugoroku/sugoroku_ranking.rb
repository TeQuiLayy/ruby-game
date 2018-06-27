require_relative "./ranking.rb"

class SugorokuRanking < Ranking
  def make_ranking_of_finished_player(finished_players)
    make_ascending_ranking(finished_players)
  end

  def make_ranking_of_unfinished_player(unfinished_players)
    make_descending_ranking(unfinished_players)
  end

  def display_ranking_all_players(finished_players, unfinished_players)
    puts "\n"
    display_ranking_finished_players(finished_players)
    display_ranking_unfinished_players(finished_players.size, unfinished_players)
  end

  private
  def display_ranking_finished_players(finished_players)
    finished_players.each do |player|
      display_ranking_finished_player(player)
    end
  end

  def display_ranking_finished_player(player)
    puts "#{player.rank}位でゴールしたのは、#{player.name}さんです。"
  end

  def display_ranking_unfinished_players(finished_players_num, unfinished_players)
    unfinished_players.each do |player|
      display_ranking_unfinished_player(finished_players_num, player)
    end
  end

  def display_ranking_unfinished_player(finished_players_num, player)
    puts "現在#{player.rank + finished_players_num}位は、#{player.name}さんです。"
  end
end
