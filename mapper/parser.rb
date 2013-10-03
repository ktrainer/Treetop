require 'Treetop'
base_path = File.expand_path(File.dirname(__FILE__))
require File.join(base_path,'node_extensions.rb')

class Parser

  Treetop.load(File.join(File.dirname(__FILE__),'mapper2.treetop'))
  @@parser = MapperParser.new



  def self.parse(data)

    # Pass the data over to the parser instance
    tree = @@parser.parse(data)
    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@@parser.index}"
    end

    # Remove all syntax nodes that aren't one of our custom
    # classes. If we don't do this we will end up with a *lot*
    # of essentially useless nodes
    self.clean_tree(tree)

    # Convert the AST into an array representation of the input
    # structure and return it
    return tree.to_array
  end

  private

  def self.clean_tree(root_node)
    return if(root_node.elements.nil?)
    root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
    root_node.elements.each {|node| self.clean_tree(node) }
  end

end










