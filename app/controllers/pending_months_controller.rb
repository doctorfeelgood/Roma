class PendingMonthsController < ApplicationController
  # GET /pending_months
  # GET /pending_months.xml
  def index
    @pending_months = PendingMonth.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pending_months }
    end
  end

  # GET /pending_months/1
  # GET /pending_months/1.xml
  def show
    @pending_month = PendingMonth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pending_month }
    end
  end

  # GET /pending_months/new
  # GET /pending_months/new.xml
  def new
    @pending_month = PendingMonth.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pending_month }
    end
  end

  # GET /pending_months/1/edit
  def edit
    @pending_month = PendingMonth.find(params[:id])
  end

  # POST /pending_months
  # POST /pending_months.xml
  def create
    @pending_month = PendingMonth.new(params[:pending_month])

    respond_to do |format|
      if @pending_month.save
        flash[:notice] = 'PendingMonth was successfully created.'
        format.html { redirect_to(@pending_month) }
        format.xml  { render :xml => @pending_month, :status => :created, :location => @pending_month }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pending_month.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pending_months/1
  # PUT /pending_months/1.xml
  def update
    @pending_month = PendingMonth.find(params[:id])

    respond_to do |format|
      if @pending_month.update_attributes(params[:pending_month])
        flash[:notice] = 'PendingMonth was successfully updated.'
        format.html { redirect_to(@pending_month) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pending_month.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_months/1
  # DELETE /pending_months/1.xml
  def destroy
    @pending_month = PendingMonth.find(params[:id])
    @pending_month.destroy

    respond_to do |format|
      format.html { redirect_to(pending_months_url) }
      format.xml  { head :ok }
    end
  end
end
