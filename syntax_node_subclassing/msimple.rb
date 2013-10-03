module Simple
  class GR  < Treetop::Runtime::SyntaxNode
    def get_token
       self.mtoken.text_value
    end
    def get_mirror
      self.mtoken.text_value+'|'+self.mtoken.reverse_it
    end
  end
  class Token   < Treetop::Runtime::SyntaxNode
    def reverse_it
      self.text_value.reverse!
    end
  end
end