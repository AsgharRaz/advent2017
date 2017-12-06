i = File.readlines('p/input02')
v = i.map { |e| e.split("\t").map(&:to_i) }

w = []
v.each do |a|
  a = a.sort.reverse
  a.each do |e|
    (a.reject { |n| n == e }).each do |r|
      w << e / r if (e % r).zero?
    end
  end
end
p v.map { |e| e.max - e.min }.sum, w.sum
