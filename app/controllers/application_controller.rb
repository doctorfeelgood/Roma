# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  layout 'main'
  
  before_filter :set_user_language  
  
  private  
  def set_user_language  
    I18n.locale = 'es'  
  end
  
  def jimmy_says(message)
    render :update do |page|
      page.replace_html :jimmy, :partial => 'shared/jimmy', :locals=>{:message => message}
      page.visual_effect :appear, "jimmy" 
    end
  end
  
  #comentario
end
