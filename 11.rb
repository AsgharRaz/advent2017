i = File.read('p/input11').strip.split(',')
x = y = 0
a = i.map do |e|
  y += 1 if e == 'n'
  y -= 1 if e == 's'
  unless e == 'n' || e == 's'
    x += 0.5 if e.include?('n')
    x -= 0.5 if e.include?('s')
    y += 0.5 if e.include?('e')
    y -= 0.5 if e.include?('w')
  end
  x.abs + y.abs
end
p a[-1], a.max
