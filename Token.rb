#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

class Token

  def initialize(line = 0)
    @text = ""
    @lineNumber = line
  end

  @@EOF = Token.new(-1)
  @@EOL = '\\n'


  def getLineNumber
    return @lineNumber
  end
  
  def isIdentifier
    return false
  end

  def isNumber
    return false
  end

  def isString
    return false
  end

#  def getNumber
#    return nil
#  end
  
  def getText
    @text
  end

  def getEOF
    @@EOF
  end

  def getEOL
    @@EOL
  end

  attr_accessor :lineNumber
end
