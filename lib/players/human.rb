require 'pry'
require_relative '../player.rb'

module Players
  class Human < Player

    def move(board)
      puts "Please enter a move (1-9)"
      move = gets
      return move
    end
  end
end
