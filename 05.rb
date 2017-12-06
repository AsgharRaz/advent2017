@i = File.readlines('p/input05').map(&:to_i)
def s(d)
  a = @i.clone
  n = c = 0
  while a[n]
    c += 1
    i = a[n] >= 3 && d ? -1 : 1
    a[n] += i
    n += (a[n] - i)
  end
  c
end
p s(1), s(nil)
