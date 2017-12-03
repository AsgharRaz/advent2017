I = File.read('puzzles/02')
v = I.split("\n").map { |e| e.split("\t").map(&:to_i) }
v = v.map { |e| e.max - e.min }
p v.sum
