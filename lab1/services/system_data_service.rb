require 'ohai'

class SystemDataService 
	def initialize
		@system = Ohai::System.new
		@system.all_plugins
	end	
 
	def macaddress
		@system["macaddress"]
	end	

	def hostname
		@system["hostname"]
	end

	def cpu_model_name
		@system["cpu"]["model_name"]
	end	
end 