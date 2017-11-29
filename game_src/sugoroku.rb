require "io/console"

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

