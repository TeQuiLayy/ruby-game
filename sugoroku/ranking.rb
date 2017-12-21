class Ranking
  def make_ascending_ranking(players, top_rank)
    players.each do |player|
      if player
        player.rank = top_rank
        players.each do |compare_player|
          if player.get_point > compare_player.get_point
            player.rank += 1
          end
        end
      end
    end
    players.sort_by!{|player| player.rank}
  end

  def make_descending_ranking(players, top_rank)
    players.each do |player|
      if player
        player.rank = top_rank
        players.each do |compare_player|
          if player.get_point < compare_player.get_point
            player.rank += 1
          end
        end
      end
    end
    players.sort_by!{|player| player.rank}
  end

end
