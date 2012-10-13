#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby
require './token.rb'
require './lexer.rb'
require './code-dialog.rb'

l = Lexer.new
t = Token.new

p l
p t

while (t = l.read()) != Token.new().getEOF
  p t
  puts "=>" + t.getText()
end
