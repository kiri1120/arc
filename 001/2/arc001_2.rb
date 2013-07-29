#!/usr/bin/env ruby
# coding: utf-8

data = STDIN.read
now, target = data.strip.split(" ").map(&:to_i)

diff = (now.to_i - target.to_i).abs
count = 0

while diff > 10 do
  diff -= 10
  count += 1
end

if diff > 7
  diff = (diff - 10).abs
  count += 1
elsif diff > 3
  diff = (diff - 5).abs
  count += 1
end

count += diff
puts count
