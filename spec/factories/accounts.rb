require 'faker'

FactoryGirl.define do
  factory :account do
    subdomain { Faker::Company.name.downcase.gsub(/[^0-9A-Za-z]/, '') }
    company_name { Faker::Company.name }
  end
end
