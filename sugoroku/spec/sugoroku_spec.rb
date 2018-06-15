require "spec_helper"
require_relative "../sugoroku_player"
require_relative "../sugoroku_basic_func"

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
