i = File.readlines('p/input13').map { |e| [(f = e.split(':').map(&:to_i))[0], (f[1] - 1) * 2] }.to_h
d = 0
b = i.map { |k, v| - k % v }
d += 1 until i.map { |_, v| d % v }.each_with_index.find { |e, j| e == b[j] }.nil?
p i.select { |k, v| (k % v).zero? }.map { |k, v| k * (v / 2 + 1) }.sum, d
