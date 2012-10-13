require 'sinatra'

if development?
  require 'sinatra/reloader'
end

get '/' do
  erb :index
end

post '/result' do
  erb :result, :locals => {:res => params[:text]}
end
