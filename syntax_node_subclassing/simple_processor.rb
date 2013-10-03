base_path = File.dirname(__FILE__)

require 'Treetop'
require File.join(base_path,'mSimple.rb')

Treetop.load(File.join(base_path,'Simple.treetop') )
puts "Loaded Simple Grammer"


def walk_tree node
  if node.respond_to? :reverse_it
     puts node.class
    puts node.reverse_it

  end
  node.elements.each { |e| walk_tree e } if node.elements
end

def clean_tree(root_node)
  return if(root_node.elements.nil?)
  root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
  root_node.elements.each {|node| clean_tree(node) }
end

parser = SimpleParser.new

result = parser.parse('  dude ')

unless result.nil?

  #clean_tree(result)
  puts result.get_token
  puts result.get_mirror
  #p result

  #walk_tree result


else
  unless parser.terminal_failures.empty?
    puts parser.failure_reason
  else
    puts "I had a problem with line #{parser.failure_line} column #{parser.index+1}"
  end
end

