#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

class Lexer

  def initialize(r)
    # regexPat = "\\s*((//.*)|([0-9]+)|(\"(\\\\\"|\\\\\\\\|\\\\n|[^\"])*\")" + "|[A-Z_a-z][A-Z_a-z0-9]*|==|<=|>=|&&|\\|\\||\\p{Punct})?"
    regexPat = ""
    r = Regexp.new(regexPat)
    @queue = []
    @hasMore = true
    # @reader = r
  end

  def read
    if fillQueue 0
      return @queue.delete_at(0)
    else
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
    end
  end
  
  def readLine
    @line = gets.chomp
    
    if @line == "" 
      @hasMore = false
      return
    end
  end
  
  def addToken(lineNo, matcher)
    puts 'addToken'
  end
  
  def toStringLiteral(s)
    puts 'toStringLiteral'
  end

  class NumToken < Token
    @value = nil
    
    def NumToken(line, v)
      puts 'NumToken.NumToken'
    end

    def isNumber
      return false
    end
    
    def getText
      puts 'NumToken.getText'
    end

    def getNumber
      puts 'NumToken.getNumber'
    end
  end

  class IdToken < Token
    text = ''
    
    def IdToken(line, id)
      puts 'IdToken.IdToken'
    end

    def isidentifier
      return true
    end

    def getText
      puts 'IdToken.getText'
    end
  end

  class StrToken < Token
    literal = ''
    
    def StrToken(line, str)
      puts 'StrToken.StrToken'
    end
  
    def isString
      return true
    end

    def getText
      puts 'StrToken.getText'
    end
  end
end
