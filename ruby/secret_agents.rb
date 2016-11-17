def encrypt(string)
  result = ""
  i = 0
  while i < string.length
    if string[i] == " "
      result += " "
    elsif string[i] == "z"
      result += "a"
    else
      result += string[i].next
    end
  i += 1
  end
  result
end

def decrypt(string)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  result = ""
  i = 0
  while i < string.length
    if string[i] == " "
      result += " "
    else
    result += alphabet[(alphabet.index(string[i])) - 1]
    end
  i += 1
  end
  result
end

puts "Would you like to decrypt or encrypt a password? (decrypt / encrypt)"
response = gets.chomp

until response == "decrypt" || response == "encrypt"
  puts "Please enter a valid response"
  puts ""
  puts "Would you like to decrypt or encrypt a password? (decrypt / encrypt)"
  response = gets.chomp
end

puts "Please enter password"
password = gets.chomp

puts "Here is your result:"
if response == "decrypt"
  puts decrypt(password)
elsif response == "encrypt"
  puts encrypt(password)
end