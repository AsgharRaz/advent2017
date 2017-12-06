s = a = [File.read('p/input06').split.map(&:to_i)]
loop do
  a = s[-1].clone
  a[g = a.index(f = a.max)] = 0
  f.times { a[(g += 1) % a.length] += 1 }
  break if s.uniq!
  s << a
end
p t = s.length, t - s.index(a)
