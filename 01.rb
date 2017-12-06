i = File.read('p/input01').strip
v = i.split('').map(&:to_i)
def o(v, c)
  v.each_with_index.inject(0) do |a, (n, i)|
    a + (n == v[(i + c) % v.length] ? n : 0)
  end
end
p o(v, 1), o(v, v.length / 2)
