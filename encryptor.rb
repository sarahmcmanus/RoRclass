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

end