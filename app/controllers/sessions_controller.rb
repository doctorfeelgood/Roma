class SessionsController < ApplicationController
	
def login
	session[:title]='Ingresar al sistema' 
	session[:image] = 'notices.png'
end	
	
def authenticate
  	@user=User.find_by_username(params[:username])
  	if @user
  		if @user.password==params[:password]
  			session[:access_granted]=true
  			session[:user]=@user
  			flash[:notice]="Bienvenido #{@user.name}"
  			redirect_to(session[:user].landing_page)
  		else
  			session[:access_granted]=false
  			flash[:notice]='Los datos son incorrectos'
  			redirect_to(session[:user].landing_page)
  		end
  	else
  		#NO SE ENCONTRO EL USERNAME
  		session[:access_granted]=false
  		flash[:notice]='Datos de conexión incorrectos'
  		redirect_to :back
  	end #end del si existe el user
  	
  end
	
  def logout
  	session[:access_granted]=false
  	session[:user]=nil
  	redirect_to :back;
  end
  
end
