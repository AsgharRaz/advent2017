i = File.read('p/input10').strip
j = i.each_byte.map { |e| e }
j += [17, 31, 73, 47, 23]
def k(j, x = 64)
  a = *(0..255)
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
b = k(i.split(',').map(&:to_i), 1)
p b[0] * b[1]
p k(j).each_slice(16).map { |e| e.inject(:^).to_s(16) }.join
