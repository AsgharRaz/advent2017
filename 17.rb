steps = File.read('p/input17').to_i
arr = [0]
pos = incr = fvoi = 0
voi = nil

while incr < 50_000_000
  incr += 1
  pos = ((pos + steps) % incr) + 1
  arr.insert(pos, incr) if incr <= 2017 || pos == 1
  fvoi = arr[(pos + 1) % incr] if incr == 2017
  voi = arr[1] if pos == 1
  print "#{fvoi} | #{voi} (#{incr})\r"
end


  p "#{fvoi} | #{voi} (#{incr})"
