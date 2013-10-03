require 'treetop'

Treetop.load "./simple_ast.treetop"

class Identifier
  def initialize (name)
    @name = name
  end
end

class Operation
  def initialize (operator, operand1, operand2)
    @operator = operator
    @operand1 = operand1
    @operand2 = operand2
  end
end

SimpleASTparser = SimpleASTParser.new

parse = SimpleASTparser.parse "abc=1234"
puts 'Parse Tree'
puts '----------'
puts
p parse
puts
puts

abstract_syntax_tree = parse.ast
puts 'Abstract Syntax Tree'
puts '--------------------'
puts
p abstract_syntax_tree

