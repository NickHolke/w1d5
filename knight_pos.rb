eight = [
[pos.first - 1, pos.last + 2],
[pos.first - 2, pos.last + 1],
[pos.first - 2, pos.last - 1],
[pos.first - 1, pos.last - 2],
[pos.first + 1, pos.last - 2],
[pos.first + 2, pos.last - 1],
[pos.first + 2, pos.last + 1],
[pos.first + 1, pos.last + 2]
]


eight.each do |new_p|
  if (0 <= new_x && new_x <= 7) && (0 <= new_y && new_y <= 7
    new_x, new_y = new_p[0], new_p[-1]
    new_pos = [new_x, new_y]
  end
end
