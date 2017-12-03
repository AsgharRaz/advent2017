I = File.read('puzzles/02')
v = I.split("\n").map { |e| e.split("\t").map(&:to_i) }
p v.map { |e| e.max - e.min }.sum
w = []
v.each do |a|
  arr = a.sort.reverse
  arr.each do |e|
    (arr.reject { |n| n == e }).each do |ie|
      w << e / ie if (e % ie).zero?
    end
  end
end
p w.sum
