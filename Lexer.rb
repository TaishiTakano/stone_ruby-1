#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

class Lexer

  def initialize
    regexPat = "\\s*((//.*)|([0-9]+)|(\"(\\\\\"|\\\\\\\\|\\\\n|[^\"])*\")" + "|[A-Z_a-z][A-Z_a-z0-9]*|==|<=|>=|&&|\\|\\||\\p{Punct})?"
    @pattern = Regexp.new(regexPat)
    @queue = []
    @hasMore = true
  end

  def read
    if fillQueue 0
      p "@queue.delete_at(0)"
      return @queue.delete_at(0)
    else
      p "Token.new().getEOF"
      return  Token.new().getEOF
    end
  end
  
  def peek(i)
    if fillQueue i
      return queue[i]
    else
      return Token.new().getEOF
    end
  end
  
  def fillQueue(i)
    while i >= @queue.size
      if @hasMore
        readLine()
      else
        return false
      end
      return true
    end
  end
  
  def readLine
    @line = gets.chomp
    
    if @line == "" 
      @hasMore = false
      return
    end

    lineNo = 0
    data = @pattern.match(@line)
    
    @queue.push(IdToken.new(lineNo, Token.new().getEOL))
      
  end
  
  def addToken(lineNo, matcher)
    
  end
  
  def toStringLiteral(s)
    puts 'toStringLiteral'
  end

  class NumToken < Token
    @value = nil
    
    def initialize(line, v)
      super(line)
      @value = v
    end

    def isNumber
      return false
    end
    
    def getText
      return @value.to_s
    end

    def getNumber
      return @value.to_i
    end
  end

  class IdToken < Token
    @text = ""
    
    def initialize(line, id)
      super(line)
      @text = id
    end

    def isidentifier
      return true
    end

    def getText
      return @text
    end
  end

  class StrToken < Token
    @literal = ""
    
    def initialize(line, str)
      super(line)
      @literal = str
    end
  
    def isString
      return true
    end

    def getText
      return @literal
    end
  end
end
