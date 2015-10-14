require_relative 'system_data_service'

class FingerprintService
	def initialize 
		@system = SystemDataService.new
	end	

	def create
		sysinfo = ""
		['macaddress', 'hostname', 'cpu_model_name'].each do |f|
			sysinfo << @system.send(f)
		end
			
		get_hash(sysinfo)
	end

	def get_hex_string(byte_array = [])
		result = ""
		
		arr_size = byte_array.size

		for i in 0...(arr_size)
			b = byte_array[i]

			n1 = b & 15
			n2 = (b >> 4) & 15;	

  			if n2 > 9
            	result << (n2 - 10 + 'A'.to_i).to_s
           	else
            	result << n2.to_s
            end
            	
            if n1 > 9
            	result << (n1 - 10 + 'A'.to_i).to_s
            else
                result << n1.to_s
            end  

            if (i + 1) != arr_size && (i + 1) % 2 == 0 
            	result << "-"
            end	
		end 

		result	
	end

	def get_hash(str)
 		bytes_array = str.bytes.to_a
 		get_hex_string(bytes_array)
	end	

end 
