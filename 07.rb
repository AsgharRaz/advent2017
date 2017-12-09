i = File.read('p/input07').split("\n")
s = @p = {}
i.each { |e| @p[e.split[0].to_sym] = { c: (s.split(', ').map(&:to_sym) unless (s = e.gsub(/.*\> /, '')).split[0] == e.split[0]), w: e.gsub(/.*\(/, '').gsub(/\).*/,'').to_i } }

def w(p)
  return @p[p][:w] unless @p[p][:c]
  @p[p][:w] + @p[p][:c].map { |e| w(e) }.inject(:+)
end

def d(p)
  t = @p[p][:c].map { |e| [e, w(e)] }.to_h
  b = (f = t.values.uniq).size > 1 ? f.inject(:-) : 0
  [b, t.key(b < 0 ? f[1] : f[0])]
end

def u(p)
  return p if d(p)[0].zero?
  u(d(p)[1])
end

p r = (@p.map { |k, _| k }.compact - @p.map { |_, v| v[:c] }.compact.flatten)[0], @p[u(r)][:w] + d(r)[0]
