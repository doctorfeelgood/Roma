class PendingMonth < ActiveRecord::Base
	belongs_to :membership
	belongs_to :rate
end
