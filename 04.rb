I = File.readlines 'p/input04'
c = ->(u) { u.uniq.length == u.length }
p I.map(&:split).count(&c)
p I.map { |e| e.split.map(&:chars).map(&:sort).map(&:join) }.count(&c)
