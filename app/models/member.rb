class Member < ActiveRecord::Base
  has_one :feed
  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  validates :username, :password, length: { in: 6..20 }
  validates :email, format: { with: /\S{2,}@{1}\S{2,}.{1}\S{2,}/, message: "Incorrect Email format" }

  def self.member_validation_messages
    member = Member.new
    unless member.valid?
      p member.errors
    end
  end
end
