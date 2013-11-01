require 'sinatra'
require 'active_record'
require 'sinatra/flash'
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
  if session["user"]
    redirect '/list'
  else
    flash[:notice] = "Please provide a valid username and/or password"
    redirect '/'
  end
end

post '/sign_in' do
  @user = Member.find_by_username(params[:username])
  if @user.password == params[:password]
    session[:user] = @user.username
    redirect '/'
  else
    flash[:notice] = "Please provide a valid username and password combination"
    redirect '/'
  end
end

get '/list' do
  @list = Member.all
  erb :list
end

post '/sign_out' do
  session["user"] = nil
  redirect '/'
end

post '/post/new' do
  user_id = Member.where(username: session["name"])
  feed_id = Feed.where(member_id: user_id)
  Post.create(feed_id: feed_id, title: params[:title], content: params[:content])
  redirect '/'
end

# helper methods

# helpers do
#   authenticate
#   authorize per page
#   OAuth
#   enable sessions
#   session[:user_id]
