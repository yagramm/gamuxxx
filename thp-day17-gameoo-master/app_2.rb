require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'

def perform

player1 = HumanPlayer.new("AliceU")
player2 = HumanPlayer.new("BobU")
player3 = Player.new("WeakHuman")

binding.pry

end

perform
