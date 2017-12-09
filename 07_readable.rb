i = File.read('p/input07').split("\n")
search = @progs = {}
i.each do |e|
  children = search.split(', ').map(&:to_sym) unless (search = e.gsub(/.*\> /, '')).split[0] == e.split[0]
  @progs[e.split[0].to_sym] = {
    children: children,
    weight: e.gsub(/.*\(/, '').gsub(/\).*/, '').to_i
  }
end

def weight(prog, r = @progs[prog][:children] ? @progs[prog][:weight] + @progs[prog][:children].map { |e| weight(e) }.inject(:+) : @progs[prog][:weight])
  r
end

def branch_info(prog)
  children_tower = @progs[prog][:children].map { |e| [e, weight(e)] }.to_h
  diff = (diffs = children_tower.values.uniq).size > 1 ? diffs.inject(:-) : 0
  [diff, children_tower.key(diff < 0 ? diffs.max : diffs.min)]
end

def up_the_tree(prog)
  obj = branch_info(prog)
  return prog if obj[0].zero?
  up_the_tree(obj[1])
end

p root = (@progs.map { |key, value| key }.compact - @progs.map { |key, value| value[:children] }.compact.flatten)[0]
p @progs[up_the_tree(root)][:weight] + branch_info(root)[0]
