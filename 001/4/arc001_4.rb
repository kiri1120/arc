#!/usr/bin/env ruby
# coding: utf-8

n = gets.strip.to_i
start, goal = gets.strip.split(" ").map(&:to_i);
course_l = []
course_r = []
(0 .. n).each do |i|
  course_l[i], course_r[i] = gets.strip.split(" ").map(&:to_i);
end

course_l[n] = goal
course_r[n] = goal

ty = 0;
lva = nil
rva = nil;
lwy = 0
rwy = 0;
d = 0.0;

(1 .. n).each do |y|
  va = (course_l[y] - start).to_f / (y - ty).to_f;
  if (lva == nil) || (va > lva)
    lva = va;
    lwy = y;
  end

  va = (course_r[y] - start).to_f / (y - ty).to_f;
  if (rva == nil) || (va < rva)
    rva = va;
    rwy = y;
  end

  if lva > rva
    if y == rwy
      x = course_l[lwy];
      y = lwy;
    else
      x = course_r[rwy];
      y = rwy;
    end
    p d += Math::sqrt((x - start) ** 2 + (y - ty) ** 2);
    start = x
    ty = y
    lva = nil; rva = nil;
  end
end

d += Math::sqrt((goal - start) ** 2 + (n - ty) ** 2);
puts d
