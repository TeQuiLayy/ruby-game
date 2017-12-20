require "../spec_helper"
require_relative "../../game_src/sugoroku/sugoroku"

describe "プレイヤーエントリー" do
  it "yuya" do
    player1 = Player.new("yuya")
    expect(player1.name).to eq "yuya"
    puts player1.play
  end
  it "tequila" do
    player2 = Player.new("tequila")
    expect(player2.name).to eq "tequila"
    puts player2.play
  end
end

describe "ダイスロール" do
  it "6面" do
    dice1 = Dice.new(6)
    expect(dice1.sides).to eq (1..6)
    puts dice1.roll
  end
end
