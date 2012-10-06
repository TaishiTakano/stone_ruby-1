#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

class Token
  EOF = Token.new
  EOL = '\\n'

  lineNumber =  nil
  
  def Token(line)
    lineNumber = line
  end
  
  def getLineNumber
    return lineNumber
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

  def getNumber
    return nil
  end
  
  def getText
    return ''
  end
end
