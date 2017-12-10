j = []
i = File.read('p/input10').strip.each_byte { |c| j << c }
j += [17, 31, 73, 47, 23]
v = *(0..255)
def k(j, a, x = 64)
  f = t = s = 0
  x.times do
    j.each do |l|
      n = 0
      while 2 * n < l - 1
        m = a[v = (f + n) % a.size]
        a[v] = a[t = (f + l - 1 - n) % a.size]
        a[t] = m
        n += 1
      end
      f = (f + l + s) % a.size
      s += 1
    end
  end
  a
end
b = k(i.split(',').map(&:to_i), v.clone, 1)
p b[0] * b[1]
c = k(j, v)
h = []
c.each_slice(16) { |e| h << e.inject(:^).to_s(16) }
p h.join
