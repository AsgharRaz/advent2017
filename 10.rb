j = []
i = File.read('p/input10').strip.each_byte { |c| j << c }
j += [17, 31, 73, 47, 23]
a = *(0..255)
f = t = s = 0
64.times do
  j.each do |l|
    t = (f + l - (l.zero? ? 0 : 1)) % a.size
    if f <= t
      a[f..t] = a[f..t].reverse
    else
      z = a.size - 1
      o = (a[f..z] + a[0..t]).reverse
      a[f..z] = o[0..z - f]
      a[0..t] = o[a.size - f..o.size - 1]
    end
    f = (f + l + s) % a.size
    s += 1
    p a[0] * a[1] if s == i.size - 1
  end
end
h = []
a.each_slice(16) { |e| h << e.inject(:^).to_s(16) }
p h.join
