i = File.read('p/input09').gsub(/!./, '')

def s(g, l = 1)
  return l * 1 if g.size.zero?
  l * 1 + g.map { |e| s(e, l + 1) }.sum
end
j = i.gsub(/[^{}<>]|<[^>]*>/, '').gsub(/\}\{/, '},{').tr('{', '[').tr('}', ']')
p i.scan(/<[^>]*>/).map { |e| e.size - 2 }.sum, s(eval(j))
