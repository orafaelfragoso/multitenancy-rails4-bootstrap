class Account < ActiveRecord::Base
  has_many :users

  validates :subdomain, presence: true,
                        uniqueness: true,
                        subdomain: true

  validates :company_name, presence: true,
                           uniqueness: true
end
