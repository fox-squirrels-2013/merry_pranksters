require 'bcrypt'

class Member < ActiveRecord::Base
  include BCrypt
  has_one :feed
  validates :username, :password_hash, presence: true
  validates :username, uniqueness: true
  validates :username, length: { in: 3..20 }
  # validates :email, format: { with: /\S{2,}@{1}\S{2,}.{1}\S{2,}/ }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
