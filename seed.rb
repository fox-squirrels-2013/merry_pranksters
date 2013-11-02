require 'active_record'
require 'faker'
require_relative './app/models/member'
require_relative './app/models/post'
require_relative './app/models/feed'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'social_network')

60.times do
  mem = Member.create!(username: Faker::Name.first_name, password: Faker::Internet.password)
  Feed.create!(member_id: mem.id)
end

100.times do
  Post.create!(feed_id: rand(1..20),title: Faker::Lorem.word, content: Faker::Lorem.sentence)
end
