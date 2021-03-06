require './lib/enigma.rb'

arguments = ARGV
read_file = File.open("#{arguments[0]}", "r")
text = read_file.read
read_file.close

e = Enigma.new
output = e.decrypt(text, arguments[2], arguments[3])

o = Offsets.new
o.offset_generator(date=Date.today)

decrypted_file = File.open("#{arguments[1]}", "w")
decrypted_file.write(output)
decrypted_file.close

puts "Created '#{arguments[1]}' with the key #{e.key} and #{o.date}"
