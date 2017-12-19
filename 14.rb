@i = File.read('p/input14').strip
def k(j)
  a = *(0..255)
  f = t = s = 0
  64.times do
    j.each do |l|
      n = 0
      while 2 * n < l - 1
        m = a[v = (f + n) % a.size]
        a[v] = a[t = (f + l - 1 - n) % a.size]
        a[t] = m
        n += 1
      end
      f = (f + l + s) % a.size
      s += 1
    end
  end
  a
end

def w(n)
  j = "#{@i}-#{n}".each_byte.map { |c| c }
  j += [17, 31, 73, 47, 23]
  k(j)
    .each_slice(16)
    .map { |e| format('%02x', e.inject(:^)) }.join.chars
    .map { |e| format('%04b', e.hex) }.join.chars.map(&:to_i)
end

def r(c, g, t)
  n =
    [[-1, 0], [0, -1], [1, 0], [0, 1]]
    .map { |e| [e, c].transpose.map { |x| x.reduce(:+) } }
    .reject { |e| e.include?(-1) || e.include?(128) || g[e[1]][e[0]] != 1 }
    .each { |e| g[e[1]][e[0]] += t }
  return if n.empty?
  n.each { |e| r(e, g, t) }
end

t = 1
g = *(0..127).map { |e| w(e) }
p g.map { |e| e.count(1) }.sum
g.each_with_index do |o, y|
  o.each_with_index do |e, x|
    next unless e == 1
    g[y][x] += t
    r([x, y], g, t)
    t += 1
  end
end
p g.flatten.max - 1
