require 'rails_helper'

RSpec.describe Account, :type => :model do

  it "is valid with a subdomain and a company name" do
    account = create(:account)
    expect(account).to be_valid
  end

  it "is invalid without a subdomain" do
    account = build(:account, subdomain: nil)
    expect(account).to have(1).error_on(:subdomain)
  end

  it "is invalid with an invalid subdomain" do
    account = build(:account, subdomain: 'invalid@domain')
    expect(account).to have(1).error_on(:subdomain)
  end

  it "is invalid without a company name" do
    account = build(:account, company_name: nil)
  end

  it "does not allow duplicate subdomains" do
    create(:account, subdomain: "agilesistemas")
    account = build(:account, subdomain: "agilesistemas")
    expect(account).to have(1).error_on(:subdomain)
  end

  it "does not allow duplicate company names" do
    create(:account, company_name: "Agile Sistemas")
    account = build(:account, company_name: "Agile Sistemas")
    expect(account).to have(1).error_on(:company_name)
  end

  it { should belong_to(:owner) }

end
