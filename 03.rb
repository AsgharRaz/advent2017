I = File.read('puzzles/03')
def lvl(x, c = 8, i = 1)
  x -= 1 if i == 1
  return { pos: x, c: c, i: i } if c > x
  lvl(x - c, c + 8, i + 1)
end
v = lvl(I.to_i)
p v[:i] + (v[:c] / 8 - v[:pos] % (v[:c] / 4)).abs
