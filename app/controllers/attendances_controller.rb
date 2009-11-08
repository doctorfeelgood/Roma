class AttendancesController < ApplicationController
  layout 'main'
  
  def search_member
    if (params[:name]!='' && params[:last_name]!='' )
      @members=Member.find(:all, :conditions=>['name LIKE ? OR last_name LIKE ?', "%#{params[:name]}%", "%#{params[:last_name]}%"])
    elsif (params[:name]!='')
      @members=Member.find(:all, :conditions=>['name LIKE ?', "%#{params[:name]}%"])
    elsif (params[:last_name]!='')
      @members=Member.find(:all, :conditions=>['last_name LIKE ?', "%#{params[:last_name]}%" ])
    end
    
    if @members.size>0    
      render :update do |page|
        page.replace_html("results", :partial => "found_members", :object => @members)  
        page.visual_effect :appear, "results"
      end  
    else
      jimmy_says("Tu b&uacute;squeda no arroj&oacute; ning&uacute;n resultado muchach@. Sigue esforz&aacute;ndote")
    end
  end
  
  
  def today
  end
  
  def calendar
    session[:title]='Lista '
  end
  
  
  
  # GET /attendances
  # GET /attendances.xml
  def index    
    @attendances = Attendance.find(:all, :order=>'created_at DESC')
    session[:image]='attendances.png'
    session[:title]='Asistencia de hoy'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.xml
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.xml
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.xml
  def create
    #@attendance = Attendance.new(params[:attendance])
    
    if Membership.exists?(params[:membership])
      membership=Membership.find(params[:membership])
      @attendance=Attendance.new(:member_id=>membership.member.id)
      @attendance.save
      session[:from_results] = params[:from_results] ? true : false
    else
      jimmy_says("No hay ning&uacute;n miembro con ese n&uacute;mero")
    end      
  end

  # PUT /attendances/1
  # PUT /attendances/1.xml
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        flash[:notice] = 'Attendance was successfully updated.'
        format.html { redirect_to(@attendance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.xml
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to(attendances_url) }
      format.xml  { head :ok }
    end
  end
end
