require "io/console"

class Player
  attr_accessor :advance
  attr_reader   :name

  def initialize(name)
    @name = name
  end

  @advance
end

def sugoroku_main
  puts "何人でプレイしますか？"

  players_num = gets.chomp.to_i
  players = []

  sugoroku_entry(players, players_num)
  sugoroku_play(players, players_num)
end

def sugoroku_entry(players, players_num)
  ii = 0
  while ii < players_num
    puts "#{ii+1}人目の名前を入力してください。"
    players << Player.new(gets.chomp)
    ii += 1
  end
end

def sugoroku_play(players, players_num)
  ii = 0
  while ii < players_num
    puts players[ii].name
    ii += 1
  end
end

sugoroku_main

puts "サイコロを6回振ってください。"
puts "20マス進めばあなたの勝ちです！"

progress = 0

6.times { |n|
  STDIN.getch

  dice = rand(1..6)
  progress += dice

  puts "\n#{dice}が出ました！"

  if progress <= 5
    puts "現在は#{progress}マス目です。頑張って進みましょう！"
  elsif 5 < progress && progress <= 10
    puts "現在は#{progress}マス目です。まだまだ序盤です！"
  elsif 10 < progress && progress <= 15
    puts "現在は#{progress}マス目です。中間地点を超えました！"
  elsif 15 < progress && progress < 20
    puts "現在は#{progress}マス目です。ゴールが見えてきました！"
  else
    puts "ゴールです！ おめでとうございます！"
    puts "\nあなたがサイコロを振った回数は#{n+1}回です。"
    break
  end

  if n == 5 && progress <20
    puts "\n残念ですが、ゴール出来ませんでした。次回は頑張りましょう！"
  end
}

