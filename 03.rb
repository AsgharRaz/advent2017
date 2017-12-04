I = File.read('p/03').to_i
def k(x, c = 8, i = 1)
  return { p: x, c: c, i: i } if c + 1 > x
  k(x - c, c + 8, i + 1)
end

def m(n1, n2)
  l(1, [[c(n1)[0] + 1, c(n1)[1]]]).include?(c(n2))
end

def c(n)
  return [0, 0] if n == 1
  v = k(n - 1)
  c = l(v[:i])[v[:p] - 1]
  [c[0], c[1]]
end

def l(l, s = [[l, l - 1]])
  (2 * l - 1).times { s << [s.last[0], s.last[1] - 1] }
  (2 * l).times { s << [s.last[0] - 1, s.last[1]] }
  (2 * l).times { s << [s.last[0], s.last[1] + 1] }
  (2 * l).times { s << [s.last[0] + 1, s.last[1]] }
  s
end

v = k(I - 1)
p v[:i] + (v[:c] / 8 - v[:p] % (v[:c] / 4)).abs
n = [1]
while I > n.last
  n << n.each_with_index.inject(0) do |a, (e, i)|
    a + (m(i + 1, n.length + 1) ? e : 0)
  end
end
p n.last
