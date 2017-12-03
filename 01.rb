I = File.read('puzzles/01').strip
v = I.split('').map(&:to_i)
i = 1
l = v[0]
c = v.last
s = 0
s += c if c == l
while i < v.length
  c = v[i]
  s += c if c == l
  l = c
  i += 1
end
p s

# code golf version
v=I.split('').map(&:to_i)<<v[0]
p v.each_with_index.inject(0){|a,(n,i)|a+(n==v[i+1]?n:0)}
