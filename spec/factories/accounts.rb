require 'faker'

FactoryGirl.define do
  factory :account do
    subdomain { Faker::Company.name.downcase.gsub(/[^0-9A-Za-z]/, '') }

    after(:build) do |account|
      account.users << build(:user, account: account)
    end
  end
end
