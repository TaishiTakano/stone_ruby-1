#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

class Lexer
  regexPat = ""
  r = Regexp.new(regexPat)
  queue = []
  hasMore = nil
  reader = nil
  
  def Lexer(r)
    hasMore = true
    reader = newLineNumberReader(r)
  end

  def read
    puts 'read'
  end
  
  def peek(i)
    puts 'peek'
  end
  
  def fillQueue(i)
    puts 'fillQueue'
  end

  def readLine
    puts 'readLine'
  end

  def addToken(lineNo, matcher)
    puts 'addToken'
  end
  
  def toStringLiteral(s)
    puts 'toStringLiteral'
  end

  class NumToken < Token
    value = nil
    
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
