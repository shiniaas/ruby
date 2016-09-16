filename = ARGV[0]
file = open(filename)
while text = file.gets do
	print(text)
end
file.close

str1 = "foo"
str2 = str1
print("\n", str1.object_id)
print("\n", str2.object_id)
print("\n", str1.equal?(str2))