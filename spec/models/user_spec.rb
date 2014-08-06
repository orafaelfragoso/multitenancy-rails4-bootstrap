require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with an account, email, password and confirmation" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is not valid without an account associated" do
    user = build(:user, account: nil)
    expect(user).to have(1).error_on(:account)
  end

end
