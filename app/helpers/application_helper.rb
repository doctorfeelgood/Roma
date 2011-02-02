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
  
  def new_button (text)
  	link_to_remote image_tag('add.png')+" "+text, :url=>{:action=>'new'}, :html=>{:class=>'list_footer_button_link'}
  end
  
  def actions_menu(membership)
	html = "<div style='position:relative; display:inline-block;'>
					<div>#{ link_to_function(image_tag('actions.png', :size=>'16x16', :border=>0), nil, :class=>'algo') do |page|	
									page.select(".actions_menu:not(#actions_menu_#{membership.id})").each {|mi| mi.hide }
									page.visual_effect :toggle_appear, "actions_menu_#{membership.id}", :duration => 0.5
								end }
					</div>
					<div id='actions_menu_#{membership.id}' class='actions_menu' style='display:none;''>
						<table cellpadding=0 cellspacing = 1>
							<tr><td class='menu_item'>#{link_to_remote 'Mostrar', :url=>membership, :method=>:get, :html=>{:class=>'link to_show'}}</td></tr>
							<tr><td class='menu_item'>#{link_to_remote 'Editar', :url=>edit_membership_path(membership), :method=>:get, :html=>{:class=>'link to_edit'}}</td></tr>
							<tr><td class='menu_item'>#{link_to 'Eliminar', membership, :class=>'link to_destroy', :confirm => 'Est� seguro?', :method => :delete}</td></tr>
						</table>
					</div></div>"
	html
  end
  
end
