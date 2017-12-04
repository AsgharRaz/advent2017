I = File.readlines('p/04')
v = I.map(&:split)
w = I.map { |e| e.split.map { |f| f.split('') }.map(&:sort).map(&:join) }
def c(v)
  p v.count { |e| e.uniq.length == e.length }
end
c(v)
c(w)
