
i = File.read('p/input13').split("\n").map { |e| [(f = e.split(': ').map(&:to_i))[0], (f[1] - 1) * 2] }.to_h
p i.select { |k, v| (k % v).zero? }.map { |k, v| k * (v / 2 + 1) }.sum
b = i.map { |k, v| (- k) % v }
d = 0
loop do
  break unless i.map { |_, v| d % v }.each_with_index.find { |e, j| e == b[j] }
  d += 1
end
p d
