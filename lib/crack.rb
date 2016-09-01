require './lib/enigma.rb'

arguments = ARGV
read_file = File.open("#{arguments[0]}", "r")
text = read_file.read
read_file.close

e = Enigma.new
# require "pry"; binding.pry
output = e.crack(text, arguments[2])
o = Offsets.new
o.offset_generator(date=Date.today)

cracked_file = File.open("#{arguments[1]}", "w")
cracked_file.write(output[0])
cracked_file.close

puts "Created '#{arguments[1]}' with the key #{e.key} and #{o.date}"
