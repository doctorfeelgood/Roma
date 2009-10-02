class RoutinesController < ApplicationController
  # GET /routines
  # GET /routines.xml
  def index
    @routines = Routine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @routines }
    end
  end

  # GET /routines/1
  # GET /routines/1.xml
  def show
    @routine = Routine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @routine }
    end
  end

  # GET /routines/new
  # GET /routines/new.xml
  def new
    @routine = Routine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @routine }
    end
  end

  # GET /routines/1/edit
  def edit
    @routine = Routine.find(params[:id])
  end

  # POST /routines
  # POST /routines.xml
  def create
    @routine = Routine.new(params[:routine])

    respond_to do |format|
      if @routine.save
        flash[:notice] = 'Routine was successfully created.'
        format.html { redirect_to(@routine) }
        format.xml  { render :xml => @routine, :status => :created, :location => @routine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @routine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /routines/1
  # PUT /routines/1.xml
  def update
    @routine = Routine.find(params[:id])

    respond_to do |format|
      if @routine.update_attributes(params[:routine])
        flash[:notice] = 'Routine was successfully updated.'
        format.html { redirect_to(@routine) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @routine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.xml
  def destroy
    @routine = Routine.find(params[:id])
    @routine.destroy

    respond_to do |format|
      format.html { redirect_to(routines_url) }
      format.xml  { head :ok }
    end
  end
end
