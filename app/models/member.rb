class Member < ActiveRecord::Base
  has_one :feed
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :username, :password, length: { in: 6..20 }
end
