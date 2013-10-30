require 'active_record'
require 'faker'
require_relative './app/models/member'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

60.times do
  Member.create(username: Faker::Name.first_name, password: Faker::Lorem.word)
end