#! /usr/bin/env ruby
# coding: utf-8

data = STDIN.read
length, answers = data.split("\n")

list = [0,0,0,0]

answers.split('').each do |answer|
  list[answer.to_i - 1] += 1
end

puts list.max.to_s + ' ' + list.min.to_s

