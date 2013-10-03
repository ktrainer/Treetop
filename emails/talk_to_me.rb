#!/usr/bin/env ruby
# Talk To Me  -- tell me something and I'll tell you if I understand it

require 'rubygems'
require 'treetop'

puts 'Loaded Treetop with no problems...'

Treetop.load 'double_quote'
puts 'Loaded double quote grammar with no problems...'


parser = DoubleQuoteParser.new

print "You say: "; what_you_said = gets
what_you_said.strip!

if parser.parse(what_you_said)
  puts "I say Yes! I understand!"
else
  puts "I say no, I don't understand!"
  unless parser.terminal_failures.empty?
    puts parser.failure_reason
  else
    puts "I had a problem with line #{parser.failure_line} column #{parser.index+1}"
  end

end