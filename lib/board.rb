require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(string)
    return cells[string.to_i - 1] if string.to_i != 0 && string.to_i >= 1 && string.to_i < 10
  end

  def update(cell, player)
    cells[cell.to_i - 1] = player.token if valid_move?(cell) && !full?
  end

  def full?
    cells.all?{|position| position!=" "}
  end

  def turn_count
    count = 0
    cells.each {|cell| count += 1 if cell != " "}
    count
  end

  def taken?(cell)
    position(cell) != " " ? true : false
  end

  def valid_move?(move)
    move.to_i > 0 && move.to_i < 10 && !taken?(move) ? true : false
  end
end
