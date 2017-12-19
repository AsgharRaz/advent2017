s = File.read('p/input17').to_i
a = [0]
o = i = f = v = 0
while i < 50_000_000
  i += 1
  o = ((o + s) % i) + 1
  a.insert(o, i) if i <= 2017 || o == 1
  f = a[(o + 1) % i] if i == 2017
  v = a[1] if o == 1
end
p "#{f}, #{v}"
