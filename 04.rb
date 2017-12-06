i = File.readlines 'p/input04'
c = ->(u) { u.uniq.length == u.length }
p i.map(&:split).count(&c), i.map { |e| e.split.map(&:chars).map(&:sort).map(&:join) }.count(&c)
