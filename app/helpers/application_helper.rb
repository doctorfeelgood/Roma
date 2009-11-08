# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def attendances_count(date)
    count=Attendance.find(:all, :conditions=>['created_at > ? AND created_at < ?', date, date+1]).size
    count
  end
  
end
