def stuff(progs, current, queue, crap, send, stuck)
  instructions = File.read('p/input18').split("\n").map(&:split)
  last_freq = nil
  until stuck.count { |_, v| v == true } == progs.size
    progs.each do |program|
      i = instructions[current[program]][0]
      x = instructions[current[program]][1]
      y = instructions[current[program]][2]

      x_interp = crap[program][x] && x.match(/\d/).nil? ? crap[program][x] : x.to_i
      y_interp = crap[program][y] && y && y.match(/\d/).nil? ? crap[program][y] : y.to_i
      case i
      when 'set'
        crap[program][x] = y_interp
      when 'mul'
        crap[program][x] *= y_interp if crap[program][x]
      when 'add'
        crap[program][x] += y_interp if crap[program][x]
      when 'mod'
        crap[program][x] %= y_interp if crap[program][x]
      when 'snd'
        last_freq = x_interp
        send[program] += 1
        temp = program == :a ? :b : :a
        queue[temp] << x_interp
      when 'jgz'
        current[program] += y_interp.to_i - 1 if x_interp > 0
      when 'rcv'
        if queue[program].size.zero?
          current[program] -= 1
          stuck[program] = true
        else
          crap[program][x] = queue[program].delete_at(0)
          stuck[program] = false
        end
      end
      current[program] += 1
    end
  end
  [send, last_freq]
end

current = { a: 0, b: 0 }
queue = { a: [], b: [] }
crap = { a: { 'p' => 0 }, b: { 'p' => 1 } }
send = { a: 0, b: 0 }
stuck = { a: false, b: false }

p stuff(%i(a), current, queue, crap, send, stuck)[1]
p stuff(%i(a b), current, queue, crap, send, stuck)[0]
