require 'active_record'
require 'faker'


60.times do
  Member.create(username: Faker::Name.first_name, password: Faker::Lorem.word)
end