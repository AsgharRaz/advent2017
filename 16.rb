l = File.read('p/input16').split(',')
o = [(@p = %w(a b c d e f g h i j k l m n o p)).join]
def s(n)
  a = @p[@p.size - n[0].to_i..@p.size]
  @p = a + (@p - a)
end

def x(n)
  n = n.map(&:to_i)
  t = @p[n[0]]
  @p[n[0]] = @p[n[1]]
  @p[n[1]] = t
end

def p(n)
  x(n.map(&@p.method(:find_index)))
end

def w(n)
  send(n[0].to_sym, n[1..n.size].split('/'))
end

loop do
  l.each { |f| w(f) }
  break if o.include?(@p.join)
  o << @p.join
end
print "#{o[1]},#{o[1_000_000_000 % o.size]}"
