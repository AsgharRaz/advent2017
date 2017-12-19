g = [[16_807, 48_271], File.read('p/input15').scan(/\d{0,5}/).reject(&:empty?).map(&:to_i)].transpose.to_h

def j(x, g, c, u = 0)
  (40_000_000 / x).times do
    g.each do |k, _|
      loop do
        g[k] = (g[k] * k) % 2_147_483_647
        break if (g[k] % c[k]).zero?
      end
    end
    a = g.map { |_, v| format('%b', v).chars.last(16).join }
    u += 1 if a != a | []
  end
  u
end

p j(1, g.clone, 16_807 => 1, 48_271 => 1), j(8, g, 16_807 => 4, 48_271 => 8)
