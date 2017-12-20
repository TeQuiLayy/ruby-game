class Ranking
  def make_ranking_of_finished_player(finished_players)
    finished_players.each do |player|
      if player
        player.rank = 1
        finished_players.each do |compare_player|
          if player.finish_turn > compare_player.finish_turn
            player.rank += 1
          end
        end
      end
    end
    finished_players.sort_by!{|player| player.rank}
  end

  def make_ranking_of_unfinished_player(unfinished_players, finished_players_size)
    unfinished_players.each do |player|
      player.rank = finished_players_size + 1
      unfinished_players.each do |compare_player|
        if player.position < compare_player.position
          player.rank += 1
        end
      end
    end
    unfinished_players.sort_by!{|player| player.rank}
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
