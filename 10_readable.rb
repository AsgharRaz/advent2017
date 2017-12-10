wtf = []
i = File.read('p/input10').strip.each_byte { |c| wtf << c }
wtf += [17, 31, 73, 47, 23]
list = *(0..255)
from = to = skip = 0

64.times do
  wtf.each do |instruction|
    next if instruction.zero?
    to = (from + instruction - 1) % list.size
    if from <= to
      list[from..to] = list[from..to].reverse
    else
      new_order = (list[from..list.size - 1] + list[0..to]).reverse
      list[from..list.size - 1] = new_order[0..list.size - 1 - from]
      list[0..to] = new_order[list.size - from..new_order.size - 1]
    end
    from = (from + instruction + skip) % list.size
    skip += 1
    p list[0] * list[1] if skip == i.size - 1
  end
end

dense_hash = []
list.each_slice(16) { |e| dense_hash << e.inject(:^).to_s(16) }
p dense_hash.join
