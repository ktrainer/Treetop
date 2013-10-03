Dir.chdir File.dirname(__FILE__)

require "polyglot"
require "treetop"
require 'C:\Users\ktrainer\Documents\Projects\Research\Ruby\TreeTop\Tutorial1\TreeTop_Html\simple_html.rb'



parser = SimpleHTMLParser.new

p parser.parse("")

p parser.parse("<<<<<")

p parser.parse("<p>Paragraph</p>").content