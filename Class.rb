class HelloWorld
	def initialize(myname = "Ruby")
		@name = myname
	end
	def hello
		print("Hello World. I am ", @name, "\n")
	end
	def name
		return @name
	end
	def name=(value)
		@name = value
	end
end

bob = HelloWorld.new("Bob")
alice = HelloWorld.new("Alice")
ruby = HelloWorld.new()

bob.hello
print(bob.getter, "\n")
bob.setter = "bob"
bob.hello
alice.hello
ruby.hello