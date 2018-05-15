require 'pry'
require_relative '../lib/players/human.rb'
require_relative '../lib/players/computer.rb'
require_relative '../lib/board.rb'


class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

# ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  def won?
    WIN_COMBINATIONS.each do |set|
      # binding.pry
      if set.all? { |idx| board.cells[idx] == "X"}
        return set
      elsif set.all? { |idx| board.cells[idx] == "O"}
        return set
      end
    end
    false
  end

  def draw?
    !won? && board.full? ?  true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    if won?
      winner = won?
      return board.cells[winner.first]
    end
  end

  def turn
    current_move = current_player.move(board)
    until board.valid_move?(current_move)
      current_move = current_player.move(board)
    end
    board.update(current_move, current_player)
    return current_move
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end
