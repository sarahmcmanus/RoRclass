# this is from here: http://tutorials.jumpstartlab.com/projects/encryptor.html

class Encryptor
	def cipher(rotation)
		characters = (' '..'z').to_a
		rotated_characters = characters.rotate(rotation)
		Hash[characters.zip(rotated_characters)]
	end

	def encrypt_letter(letter)
		rotation = 13
		cipher_for_rotation = cipher(rotation)
		cipher_for_rotation[letter]
	end

=begin
	def cipher
	{'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
     'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
     'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
     'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
     'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
     'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
     'y' => 'l', 'z' => 'm'}
 	end

 	def encrypt_letter(letter)
 		lowercase_letter = letter.downcase
 		cipher[lowercase_letter]
 	end
=end

 	def encrypt(string)
 		letters = string.split("")
 		results = letters.collect do |letter|
 			encrypted_letter = encrypt_letter(letter)
 		end
 		results.join
 	end 

 	#I think I should be able to call encrypt, but didn't work...
 	def decrypt(string)
 		letters = string.split("")
 		results = letters.collect do |letter|
 			encrypted_letter = encrypt_letter(letter)
 		end
 		results.join
 	end

# I do believe the following begin/end syntax will do a multiline comment
# but only if it does not start with a tab 	
=begin 
 	def encrypt(string)
 		# 1. Cut the input string into chars, stores in array called letters
 		letters = string.split("")

 		# 2. Encrypt those letters one at a time, gathering the results
 		results = []
 		# for each string in letters array, store that element to local var letter
 		# iterate through letters array
 		letters.each do |letter|
 			encrypted_letter = encrypt_letter(letter)
 			# now put the encrypted char in results array
 			results.push(encrypted_letter)
 		end
 		results.join
 	end
=end

end