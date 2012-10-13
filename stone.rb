require 'sinatra'
require './lib/lexer.rb'
require './lib/token.rb'

if development?
  require 'sinatra/reloader'
end

get '/' do
  erb :index
end

post '/result' do
  text = params[:text]
  l = Lexer.new(text)
  t = Token.new 
  tokens = Array.new()  
  #tmp = Array.new(3, "foo")
  #tokens = tmp
  tokens = l.read
  #tokens = t.getText

  # while true
    # if l.read = Token.new.getEOF then break end 
    # t = l.read
    # tokens.push t
  # end
  
  erb :result, :locals => {:res => tokens}
end
