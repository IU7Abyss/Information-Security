require_relative 'lib/des'


module Lab3 
	module_function

	def return_valid!(data)
		return data if data.is_a?(DES::Block)

		DES::Block.new(data)		
	end 
		
	def encrypt(data, key)
		data = return_valid!(data)
		key  = return_valid!(key)

		des = DES::Ctx.new(data, key)
		des.encrypt
	end	

	def decrypt(encrypted_data, key)
		encrypted_data = return_valid!(encrypted_data)
		key  = return_valid!(key)

		des = DES::Ctx.new(encrypted_data, key)
		des.decrypt
	end	
end

data = 'mysecret'
key = 'hushhush'

puts "Init data"
puts data
puts "---------------"

puts "Encrypted data:"
encrypted_data = Lab3.encrypt(data, key)
p encrypted_data

puts "Decrypted data:"
decrypted_data = Lab3.decrypt(encrypted_data, key)
p decrypted_data
puts decrypted_data.string


