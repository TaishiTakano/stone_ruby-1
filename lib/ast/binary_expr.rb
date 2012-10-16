# -*- coding: utf-8 -*-
module Ast
  class BinaryExpr < AstList
  
    def initialize(c)
      super(c)
    end

    def left
      return @child(0)
    end

    def operator
      return @child(1).token.get_text
    end
    
    def right
      return @child(2)
    end
  end
end
