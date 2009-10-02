class Attendance < ActiveRecord::Base
  has_many :members
end
