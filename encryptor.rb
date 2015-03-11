# this is from here: http://tutorials.jumpstartlab.com/projects/encryptor.html

class Encryptor
	def cipher(rotation)
		characters = (' '..'z').to_a
		rotated_characters = characters.rotate(rotation)
		Hash[characters.zip(rotated_characters)]
	end

	def encrypt_letter(letter, rotation)
		cipher_for_rotation = cipher(rotation)
		cipher_for_rotation[letter]
	end

 	def encrypt(string, rotation)
 		letters = string.split("")
 		results = letters.collect do |letter|
 			encrypted_letter = encrypt_letter(letter,rotation)
 		end
 		results.join
 	end 

 	#I think I should be able to call encrypt, but didn't work...
 	#Also think I should be able to call characters.length instead of 91...
 	def decrypt(string, rotation)
 		letters = string.split("")
 		results = letters.collect do |letter|
 			encrypted_letter = encrypt_letter(letter, 91 - rotation)
 		end
 		results.join
 	end

 	# This seems to work, except it loses line breaks somewhere in encrypt
 	def encrypt_file(filename, rotation)
 	# 1. Create the file handle to the input file
 		input = File.open(filename, "r")
 	# 2. Read the text of the input file
 		input_string = input.read
 	# 3. Encrypt the text
 		encrypted_string = encrypt(input_string, rotation)
 	# 4. Create a name for the output file
 		output_file = filename + ".encrypted"
 	# 5. Create an output file handle
 		out = File.open(output_file, "w")
 	# 6. Write out the text
 		out.write(encrypted_string)
 	# 7. Close the file
 		out.close
 	end

 	def decrypt_file(filename, rotation)
 		input = File.open(filename, "r")
 		input_string = input.read
 		decrypted_string = decrypt(input_string, rotation)
 		output_file = filename.gsub("encrypted", "decrypted")
 		out = File.open(output_file, "w")
 		out.write(decrypted_string)
 		out.close
 	end

 	def supported_characters
 		(' '..'z').to_a
 	end

 	def crack(message)
 		supported_characters.count.times.collect do |attempt|
 			decrypt(message,attempt)
 		end
 	end

end