require 'rubygems'
require 'rparsec'

lexer_num = RParsec::Parsers.number
lexer_num_token = lexer_num.token(:num)

lexer_num_lexeme = lexer_num_token.lexeme
p lexer_num_lexeme.parse(' 1234 5678 9012 ')
