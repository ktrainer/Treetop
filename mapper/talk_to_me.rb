#!/usr/bin/env ruby
# Talk To Me  -- tell me something and I'll tell you if I understand it

require 'rubygems'
require 'treetop'

puts 'Loaded Treetop with no problems...'

Treetop.load 'mapper'
puts 'Loaded mapper grammar with no problems...'

s = <<TEST
SourceFolder: m:\\mystuff\\test
File: TheData.csv { COL 1
                  , COL_2
                  , COL3  => tgtcol3
                  }

File: Other.csv { oc1
                , oc2
}
TEST

parser = MapperParser.new


what_you_said = s
what_you_said.strip!

if result = parser.parse(what_you_said)
  puts "I say Yes! I understand!"
  #puts result.folder_spec.folder_path.text_value
  #p result.file_list.list_of_files
  result.file_list.list_of_files.each do |f|
    puts f[0]
     f[1].each {|key,value| puts "\t#{key} = #{value}"} if f[1] #.file_spec.column_list.list_of_columns.each{|key,value| puts " #{key} = #{value}"}
  end


else
  puts "I say no, I don't understand!"
  unless parser.terminal_failures.empty?
    puts parser.failure_reason
  else
    puts "I had a problem with line #{parser.failure_line} column #{parser.index+1}"
    puts "To be hones,I wasn't expecting you to say anything else."
  end

end