require 'spec_helper'

describe Member do

  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :username }
    it { should ensure_length_of(:username).is_at_least(6) }
    it { should ensure_length_of(:password).is_at_least(6) }
    it { should allow_value("something@example.com").for(:email) }
    it { should_not allow_value("a@s").for(:email) }
    it { should_not allow_value("asllksj").for(:email) }
    it { should_not allow_value("askdj.com").for(:email) }
  end

end