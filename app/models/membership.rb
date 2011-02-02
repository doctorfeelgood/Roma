class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :rate
  has_many :payments
  has_many :pending_months
end
