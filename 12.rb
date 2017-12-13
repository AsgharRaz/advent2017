def h(r)
  return if (@d[r] - @c).empty?
  @c += (@d[r].reject { |k| @c.include? k })
  @d[r].map { |k| h k }
end
g = []
@d = File.read('p/input12').split("\n").map do |e|
  e = e.split(' <-> ')
  [e[0], e[1].split(', ')]
end.to_h
@d.keys.each do |k|
  next if g.flatten.include? k
  @c = []
  h k
  g << @c
end
p g[0].size, g.size
