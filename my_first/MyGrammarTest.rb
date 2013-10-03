require 'polyglot'
require 'treetop'
require 'C:\Users\ktrainer\Documents\Projects\Research\Ruby\TreeTop\my_first\mygrammar.rb'

mparser = MyGrammarParser.new

s = <<TEST
  Folder: m:\IT\Projects
TEST

tree = mparser.parse("Folder: M:\\A\\kevins\\working\\folder")
p tree
if ! tree
  puts '>>> '
  puts mparser.failure_reason
end

puts "folder: #{tree.getFolder}" if tree
