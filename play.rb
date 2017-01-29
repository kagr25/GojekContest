require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "game"
require 'colorize'

class Play

  def initialize
    puts "Enter 1 for Hit, 2 for Stand".red
    @game = Game.new
    while(1)
      input = gets.chomp
      input.to_i == 1 ? @game.hit : @game.stand
      break if !@game.winner.nil?
    end
  end
end

Play.new

