#!/usr/bin/env ruby
# coding: utf-8

course_l = []
course_r = []
curve = []

n = gets.strip.to_i
start, goal = gets.strip.split(" ").map(&:to_i);
(0 .. n).each do |i|
  course_l[i], course_r[i] = gets.strip.split(" ").map(&:to_i);
end

course_l[n] = goal
course_r[n] = goal

curve[0] = start
curve[n] = goal

a = 0
b = 0

begin
  collision = false

  (1 .. n).each do |x|
    unless curve[x].nil?
      next
    end

    x1 = 0;
    x2 = n;
    (x - 1 .. 0).each do |i|
      unless curve[i].nil?
        x1 = i
        break
      end
    end
    (x + 1 .. n).each do |i|
      unless curve[i].nil?
        x2 = i
        break
      end
    end

    a = (curve[x2] - curve[x1]).to_f / (x2 - x1).to_f
    b = (curve[x1]) - a * x1

    y = a * x + b
    if y < course_l[x]
      collision = true
      curve[x] = course_l[x]
    elsif y > course_r[x]
      collision = true
      curve[x] = course_r[x]
    end
  end
end while collision == true

distance = 0.0
lx = 0
(1 .. n).each do |x|
  if curve[x].nil?
    next
  end

  distance += Math::sqrt((curve[x] - curve[lx]) ** 2 + (x - lx) ** 2)
  lx = x
end
puts distance
