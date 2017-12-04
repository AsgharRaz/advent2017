I = File.read('puzzles/04')
u = I.split("\n")
v = u.map { |e| e.split(' ') }
w = u.map { |e| e.split(' ').map { |f| f.split('') }.map(&:sort).map(&:join) }
def c(v)
  s = v.count { |e| e.uniq.length == e.length }
  p s
end
c(v)
c(w)
