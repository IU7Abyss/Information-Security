require_relative 'services/fingerprint_service'

class Lab1
	WHITE_ACCESS = ['3730-3035-3630-3831-3038-6230-6262-3031-6443-6163-4265-6561-2350-7265-2375-7365-7249-6474-6562-2852-2920-4365-7265-2854-4329-2069-3523-3234-3335-4320-4350-5520-4020-3224-3430-4748-70']

	def initialize
		fingerprint = FingerprintService.new 
		@current_finger_print = fingerprint.create
	end 

	def my_fingerprint
		@current_finger_print
	end	

	def forbidden?
		!WHITE_ACCESS.include?(@current_finger_print)
	end
end

lab1 = Lab1.new

puts "My fingerprint:"
puts lab1.my_fingerprint
puts "-------------"

if lab1.forbidden?
	puts "Forbidden. You can't use this program" 
else
	puts "OK. Go on."
end 	