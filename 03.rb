I = File.read('puzzles/03')
def lvl(x, c = 8, i = 1)
  return { p: x, c: c, i: i } if c > x
  lvl(x - c, c + 8, i + 1)
end
v = lvl(I.to_i - 1)
p v[:i] + (v[:c] / 8 - v[:p] % (v[:c] / 4)).abs
