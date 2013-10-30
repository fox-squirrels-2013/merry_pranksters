require 'sinatra'
require 'active_record'
require_relative './app/models/feed'
require_relative './app/models/post'
require_relative './app/models/member'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

get '/' do
  erb :index
end

get '/list' do
  @list = Member.all
  erb :list
end





# helper methods

# helpers do
#   authenticate
#   authorize per page
#   OAuth
#   enable sessions
#   session[:user_id]

