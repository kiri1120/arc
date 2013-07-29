#! /usr/bin/env ruby
# coding: utf-8

gets
answers = gets.strip.split("").map(&:to_i)

list = [];
(1 .. 4).each do |i|
  list[i-1] = answers.count(i)
end

puts list.max.to_s + ' ' + list.min.to_s

