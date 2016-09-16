a1 = 0
a2 = 1_000_000
a3 = 0xa
puts a1, a2
puts a3

ary = [ "fred", 10, 3.14, "This is a string", "last element", ]
ary.each do |i|
	puts i
end

hsh = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
hsh.each do |key, value|
	print key, " is ", value, "\n"
end