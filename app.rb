require 'sinatra'
require 'active_record'
require_relative './app/models/feed'
require_relative './app/models/post'
require_relative './app/models/member'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

enable :sessions

get '/' do
  session["user"] ||= nil
  erb :index
end

post '/' do
  p params
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  session["user"] = params[:username]
  Member.create(username: params[:username], password: params[:password])
  # @list = Member.all   #This is hacky and we need to learn how to fix it
  # erb :list
  redirect '/list' if session["user"]
end

post '/sign_in' do
  session["user"] = params[:username]
  redirect '/'
end

get '/list' do
  @list = Member.all
  erb :list
end

post '/sign_out' do
  session["user"] = nil
  redirect '/'
end


# helper methods

# helpers do
#   authenticate
#   authorize per page
#   OAuth
#   enable sessions
#   session[:user_id]
