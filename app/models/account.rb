class Account < ActiveRecord::Base

  belongs_to :owner, class_name: 'User'

  validates :owner, presence: true

  validates :subdomain, presence: true,
                        uniqueness: true,
                        subdomain: true

  validates :company_name, presence: true,
                           uniqueness: true

  accepts_nested_attributes_for :owner
end
