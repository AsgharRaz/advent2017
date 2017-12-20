instructions = File.read('p/input18').split("\n").map(&:split)

current = 0
recovered = false
last_freq = nil

crap = {}

until recovered
  p instructions[current]
  i = instructions[current][0]
  x = instructions[current][1]
  y = instructions[current][2]

  x_interp = crap[x] if crap[x] && x && x.match(/\d/).nil? ? crap[x] : x.to_i
  y_interp = crap[y] && y && y.match(/\d/).nil? ? crap[y] : y.to_i
  case i
  when 'set'
    crap[x] = y_interp
  when 'mul'
    crap[x] *= y_interp if crap[x]
  when 'add'
    crap[x] += y_interp if crap[x]
  when 'mod'
    crap[x] %= y_interp if crap[x]
  when 'snd'
    last_freq = x_interp
  when 'jgz'
    current += y_interp.to_i - 1 if x_interp && !x_interp.zero?
  when 'rcv'
    recovered = true
    p "rcv: #{last_freq}"
  end
  current += 1
  p crap
  p '-'
end
