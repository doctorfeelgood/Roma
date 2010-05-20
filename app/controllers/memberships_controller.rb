class MembershipsController < ApplicationController
  # GET /memberships
  # GET /memberships.xml
  layout 'main'
  def index
    session[:title]='Membres&iacute;as'
    session[:image]='members.png'
    @memberships = Membership.all
    @rates = Rate.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.xml
  def show
    @membership = Membership.find(params[:id])
    @member = @membership.member

  end

  # GET /memberships/new
  # GET /memberships/new.xml
  def new
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  # POST /memberships.xml
  def create
    @membership = Membership.new(:rate_id=>params[:membership][:rate_id].to_i, :pending_months=>params[:membership][:pending_months], :pay_day=>params[:membership][:pay_day])
    @member=Member.new(params[:membership][:member])
    @member.save
    @membership.member_id=@member.id
    

    
    respond_to do |format|
      if @membership.save
      	
      	    if params[:paid]
    			@payment=Payment.new(:membership_id=>@membership.id, :rate_id=>@membership.rate_id, :paid_month=>Date.today.month, :paid_year=>Date.today.year)
    			@payment.save
    		end
      	
        flash[:notice] = 'Membership was successfully created.'
        format.html { redirect_to(memberships_path) }
        format.xml  { render :xml => @membership, :status => :created, :location => @membership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.xml
  def update
    @membership = Membership.find(params[:id])
    @member=Member.find(@membership.member_id.to_i)
    @member.update_attributes(params[:membership][:member])
    respond_to do |format|
      if @membership.update_attribute(:rate_id, params[:membership][:rate_id])
        flash[:notice] = "Los datos de la membresía #{@membership.id} de #{@member.name} #{@member.last_name} se actualizaron satisfactoriamente"
        format.html { redirect_to(memberships_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.xml
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to(memberships_url) }
      format.xml  { head :ok }
    end
  end
end
