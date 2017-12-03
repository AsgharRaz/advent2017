I = File.read('puzzles/01').strip
v = I.split('').map(&:to_i)
def sol(v, inc)
  v.each_with_index.inject(0) do |a, (n, i)|
    a + (n == v[(i + inc) % v.length] ? n : 0)
  end
end
p sol(v, 1)
p sol(v, v.length / 2)
