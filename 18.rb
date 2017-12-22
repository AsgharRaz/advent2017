def s(g, c, q, d, e, u)
  j = File.read('p/input18').split("\n").map(&:split)
  l = nil
  until u.count { |_, v| v == true } == g.size
    g.each do |n|
      i = j[c[n]][0]
      x = j[c[n]][1]
      y = j[c[n]][2]
      a = d[n][x] && x.match(/\d/).nil? ? d[n][x] : x.to_i
      b = d[n][y] && y && y.match(/\d/).nil? ? d[n][y] : y.to_i
      case i
      when 'set'
        d[n][x] = b
      when 'mul'
        d[n][x] *= b if d[n][x]
      when 'add'
        d[n][x] += b if d[n][x]
      when 'mod'
        d[n][x] %= b if d[n][x]
      when 'snd'
        l = a
        e[n] += 1
        t = n == :a ? :b : :a
        q[t] << a
      when 'jgz'
        c[n] += b.to_i - 1 if a > 0
      when 'rcv'
        if q[n].size.zero?
          c[n] -= 1
          u[n] = true
        else
          d[n][x] = q[n].delete_at(0)
          u[n] = false
        end
      end
      c[n] += 1
    end
  end
  [e, l]
end
c = { a: 0, b: 0 }
q = { a: [], b: [] }
d = { a: { 'p' => 0 }, b: { 'p' => 1 } }
e = { a: 0, b: 0 }
u = { a: false, b: false }
p s(%i(a), c, q, d, e, u)[1], s(%i(a b), c, q, d, e, u)[0]
