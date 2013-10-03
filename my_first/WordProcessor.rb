require 'polyglot'
require 'treetop'
require 'C:\Users\ktrainer\Documents\Projects\Research\Ruby\TreeTop\my_first\words.rb'

parser = WordsParser.new

a = parser.parse(" aa  ")
puts a.match_count if a
