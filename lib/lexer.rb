#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby
# -*- coding: utf-8 -*-

require "strscan"

class Token
  # uninitialized constant {クラス名} (NameError) 回避のため
end

class Lexer
  
  def initialize(t)
    @queue = []
    @hasMore = true
    @text = t
  end
  
  def read
    if fillQueue 0
      return @queue
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
    
    return true
  end
  
  def readLine    
    regexPat = "\\s*((//.*)|([0-9]+)|(\"(\\\\\"|\\\\\\\\|\\\\n|[^\"])*\")" + "|[A-Z_a-z][A-Z_a-z0-9]*|==|<=|>=|&&|\\|\\||\\p{Punct})?"
    r = Regexp.new(regexPat)
    s = StringScanner.new(@text)
    
    while !s.eos?
      @queue.push s.scan(r)
    end

    @hasmore = false
  end
end
