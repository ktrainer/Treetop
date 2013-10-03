require 'treetop'

Dir.chdir File.dirname(__FILE__)

Treetop.load('phone.treetop')

class PhoneMapper
  attr_reader :error
  def initialize
    @parser = PhoneParser.new
  end

  def parse str

    r = @parser.parse str.chomp.downcase
   unless r
      @error = @parser.failure_reason
    else
      r.get_formatted_phone if r
    end
  end
end





begin
   print 'Phone:'
   s = gets
   unless s.chomp! == ''
     parser = PhoneMapper.new
     puts parser.parse s.downcase
   end
end while s != ''
