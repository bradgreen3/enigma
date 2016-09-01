require './lib/enigma.rb'
arguments = ARGV
read_file = File.open("#{arguments[0]}", "r")
text = read_file.read
read_file.close
e = Enigma.new
output = e.encrypt(text)

o = Offsets.new
o.offset_generator(date=Date.today)

encrypted_file = File.open("#{arguments[1]}", "w")
encrypted_file.write(output)
encrypted_file.close

puts "Created '#{arguments[1]}' with the key #{e.key} and #{o.date}"
