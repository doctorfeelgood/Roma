# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def attendances_count(date)
    count=Attendance.find(:all, :conditions=>['created_at > ? AND created_at < ?', date, date+1]).size
    count
  end
  
  def spanish_month(month)
  	
  	mes = case month
  		when 1 then 'Enero'
  		when 2 then 'Febrero'
  		when 3 then 'Marzo'
  		when 4 then  'Abril'
  		when 5 then 'Mayo'
  		when 6 then 'Junio'
  		when 7 then 'Julio'
  		when 8 then 'Agosto'
  		when 9 then 'Septiembre'
  		when 10 then 'Octubre'
  		when 11 then 'Noviembre'
  		when 12 then 'Diciembre'
  		else 'No es un mes'
  	end
  	mes
  end
end
