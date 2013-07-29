#!/usr/bin/env ruby
# coding: utf-8

class Queen
  def initialize(data)
    @queen_map = data.strip.split("\n").map{|line| line.split("") }
    @map_size = @queen_map.length
    @answered = false
    init_check
  end

  def init_check
    (0 .. @map_size - 1).each do |i|
      (0 .. @map_size - 1).each do |j|
        if @queen_map[i][j] == 'Q'
          remove_queen(i, j)
          unless check_queen(i, j)
            @no_answer = true
          end
          put_queen(i, j)
        end
      end
    end
  end

  def try_queen(i)
    # 完成した場合
    if i == @map_size
      print_answer
    end

    if @answered || @no_answer
      return
    end

    # 確定済みの行はスキップ
    (0 .. @map_size - 1).each do |j|
      if @queen_map[i][j] == 'Q'
        try_queen(i + 1)
      end
    end

    # 未確定の行
    (0 .. @map_size - 1).each do |j|
      if check_queen(i, j)
        put_queen(i, j)
        try_queen(i + 1)
        remove_queen(i, j)
      end
    end
  end

  def put_queen(i, j)
    @queen_map[i][j] = 'Q'
  end

  def remove_queen(i, j)
    @queen_map[i][j] = '.'
  end

  def check_queen(i, j)
    (0 .. @map_size - 1).each do |k|
      if @queen_map[i][k] == 'Q'
        return false
      end
      if @queen_map[k][j] == 'Q'
        return false
      end
      if ((i + k < @map_size) && (j + k < @map_size) && (@queen_map[i + k][j + k] == 'Q'))
        return false
      end
      if ((i - k >= 0) && (j + k < @map_size) && (@queen_map[i - k][j + k] == 'Q'))
        return false
      end
      if ((i + k < @map_size) && (j - k >= 0) && (@queen_map[i + k][j - k] == 'Q'))
        return false
      end
      if ((i - k >= 0) && (j - k >= 0) && (@queen_map[i - k][j - k] == 'Q'))
        return false
      end
    end
    return true
  end

  def print_answer
    @answered = true
    @queen_map.each do |line|
      puts line.join("")
    end
  end

  def answered?
    @answered
  end
end
 
queen = Queen.new(STDIN.read)
queen.try_queen(0)
unless queen.answered?
  puts "No Answer"
end
