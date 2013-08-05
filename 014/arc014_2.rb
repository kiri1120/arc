#!/usr/bin/env ruby
# coding: utf-8

n = gets.strip.to_i
past = [gets.strip]
is_finish = false

(2 .. n).each do |i|
  word = gets.strip
  if (past.count(word) > 0) || (past.last[-1] != word[0])
    if i % 2 == 0
      puts "WIN"
    else
      puts "LOSE"
    end
    is_finish = true
    break
  end
  past.push(word)
end

unless is_finish
  puts "DRAW"
end
