class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :rate
  has_many :payments
end
