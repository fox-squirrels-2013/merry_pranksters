require 'sinatra'
require 'active_record'
require_relative './app/models/elephant'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

get '/' do
  "future home of the best. social. network. ever."
end
