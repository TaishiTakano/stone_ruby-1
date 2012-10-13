require './lib/lexer.rb'
require './lib/token.rb'

@text = ""

while true
  print ">>"
  s = gets.chomp
  if s == "Q" then break end
  @text +=  s
end

l = Lexer.new(@text)
t = Token.new 

tokens = Array.new()  
tokens = l.read

p tokens
