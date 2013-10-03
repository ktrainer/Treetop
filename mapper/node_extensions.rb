
module Mapper
  class MapSpec < Treetop::Runtime::SyntaxNode
    def to_array
      self.elements.collect{|e| e.to_array}
    end
  end

  class FileList  < Treetop::Runtime::SyntaxNode
    def to_array
      file_spec.to_array
    end
  end

  class FileSpec  < Treetop::Runtime::SyntaxNode
    def to_array
      p self.inspect
      self.elements[0].to_array
    end
  end

  class FileName   < Treetop::Runtime::SyntaxNode
    def to_array
      self.text_value
    end
  end


  class FolderSpec   < Treetop::Runtime::SyntaxNode
    def to_array
      puts self.elements[0].class
      self.elements[0].text_value
    end
  end

  class FolderPath   < Treetop::Runtime::SyntaxNode

  end

end