require "spec_helper"
require_relative "../sugoroku_basic_func"
require_relative "../sugoroku_ranking"
require_relative "../sugoroku_player"

describe "プレイヤーエントリー" do
  it "yuya" do
    player1 = Player.new("yuya")
    expect(player1.name).to eq "yuya"
  end
  it "tequila" do
    player2 = Player.new("tequila")
    expect(player2.name).to eq "tequila"
  end
end

describe "ダイスロール" do
  it "6面" do
    dice1 = Dice.new(6)
    100.times{
      expect(dice1.roll).to be_between(1, 6).inclusive
    }
  end
end

describe "ランキング計算" do
  ranking = SugorokuRanking.new
  ayako = SugorokuPlayer.new("ayako")
  taro = SugorokuPlayer.new("taro")
  hiroko = SugorokuPlayer.new("hiroko")
  mariko = SugorokuPlayer.new("mariko")
  it "ゴールプレイヤー不在" do
    ayako.position = 6
    taro.position = 5
    hiroko.position = 7
    mariko.position = 7
    unfinished_players = [ayako, taro, hiroko, mariko]
    ranking.make_ranking_of_unfinished_player(unfinished_players)
    expect(ayako.rank).to eq 3
    expect(taro.rank).to eq 4
    expect(hiroko.rank).to eq 1
    expect(mariko.rank).to eq 1
  end
  it "一部プレイヤーゴール" do
    ayako.position = 14
    taro.finish_turn = 4
    taro.finish_flg = true
    hiroko.position = 17
    mariko.position = 18
    finished_players = [taro]
    unfinished_players = [ayako, hiroko, mariko]
    ranking.make_ranking_of_finished_player(finished_players)
    ranking.make_ranking_of_unfinished_player(unfinished_players)
    expect(ayako.rank).to eq 3
    expect(taro.rank).to eq 1
    expect(hiroko.rank).to eq 2
    expect(mariko.rank).to eq 1
  end
  it "全プレイヤーゴール" do
    ayako.finish_turn = 5
    taro.finish_turn = 4
    hiroko.finish_turn = 5
    mariko.finish_turn = 7
    ayako.finish_flg = true
    taro.finish_flg = true
    hiroko.finish_flg = true
    mariko.finish_flg = true
    finished_players = [ayako, taro, hiroko, mariko]
    ranking.make_ranking_of_finished_player(finished_players)
    expect(ayako.rank).to eq 2
    expect(taro.rank).to eq 1
    expect(hiroko.rank).to eq 2
    expect(mariko.rank).to eq 4
  end
end
