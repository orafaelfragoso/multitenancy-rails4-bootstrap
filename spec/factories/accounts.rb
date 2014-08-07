require 'faker'

FactoryGirl.define do
  sequence(:subdomain) {|n| Faker::Company.name.downcase.gsub(/[^0-9A-Za-z]/, '') }

  factory :account do
    subdomain { Faker::Company.name.downcase.gsub(/[^0-9A-Za-z]/, '') }
    company_name { Faker::Company.name }
    association :owner, factory: :user

    factory :account_with_schema do
      after(:build) do |account|
        Apartment::Tenant.create(account.subdomain)
        Apartment::Tenant.switch(account.subdomain)
      end
      after(:create) do |account|
        Apartment::Tenant.reset
      end
    end
  end
end
