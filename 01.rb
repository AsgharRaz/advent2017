I = File.read('p/01').strip
v = I.split('').map(&:to_i)
def sol(v, c)
  v.each_with_index.inject(0) do |a, (n, i)|
    a + (n == v[(i + c) % v.length] ? n : 0)
  end
end
p sol(v, 1)
p sol(v, v.length / 2)
