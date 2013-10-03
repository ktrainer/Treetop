#!/usr/bin/env ruby
# Talk To Me  -- tell me something and I'll tell you if I understand it

require 'rubygems'
require 'treetop'

puts 'Loaded Treetop with no problems...'

Treetop.load 'email_list'
puts 'Loaded email list grammar with no problems...'


parser = EmailListParser.new

print "You say: "; what_you_said = gets
what_you_said.strip!

if result = parser.parse(what_you_said)
  puts "I say Yes! I understand!"
  puts "You said the following email addresses:"
  result.list_of_email_pairs.each do |email_pair|
    print " #{email_pair[1]}"
    print " #{email_pair[0]}" unless email_pair[0].empty?
    print "\n"
  end
else
  puts "I say no, I don't understand!"
  unless parser.terminal_failures.empty?
    puts parser.failure_reason
  else
    puts "I had a problem with line #{parser.failure_line} column #{parser.index+1}"
    puts "To be honest,I wasn't expecting you to say anything else."
  end

end