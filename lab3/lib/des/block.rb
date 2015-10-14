module DES
  class Block
    attr_reader :string, :bit_array
    
    def initialize(input)
      if input.is_a?(String)
        raise "DES::InvalidStringLength: Input String must contain (8) characters." unless input.length.eql?(8)
        
        @string    = input
        @bit_array = input.unpack('B*').join.split('').collect{|b| b.to_i}
      elsif input.is_a?(Array)
        raise "DES::InvalidArraySize: Input Array must contain (64) bits." unless input.size.eql?(64)
        
        @string    = [input.join].pack('B*')
        @bit_array = input
      else
        raise "DES::InvalidFormat: Input must be a String or an Array."
      end
    end
  end
end  