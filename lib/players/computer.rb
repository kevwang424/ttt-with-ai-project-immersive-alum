require 'pry'
require_relative '../player.rb'

module  Players
  class Computer < Player

    def move(board)
      # valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      return (rand * 10).ceil.to_s
    end

  end
end
