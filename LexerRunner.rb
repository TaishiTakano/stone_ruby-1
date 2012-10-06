#!/Users/saxsir/.rvm/rubies/ruby-1.9.3-p194/bin/ruby
require './Token.rb'
require './Lexer.rb'

l = Lexer.new
t = Token.new

for i in 1 .. 10
  puts "=>" + t.getText
end
