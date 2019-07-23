require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'

def perform

player1 = Player.new("Alice")
player2 = Player.new("Bob")

system("clear")

puts "========================="
puts "! Status of each player !"
puts "========================="
player1.show_state
player2.show_state

puts ""
puts "========================="
puts "!    Now let's fight    !"
puts "========================="
puts "Press Enter to start the fight!"
gets
  while player1.life_points * player2.life_points > 0
    puts "-" * 60
    player1.show_state
    player2.show_state
    puts ""
    player1.attacks(player2)
    break if player2.life_points <= 0
    player2.attacks(player1)
    break if player1.life_points <= 0
  end
puts "+" * 60
puts ""

end #end of perform

perform
