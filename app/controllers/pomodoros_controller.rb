class PomodorosController < ApplicationController
  # GET /pomodoros
  # GET /pomodoros.xml
  def index
    @pomodoros = Pomodoro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pomodoros }
    end
  end

  # GET /pomodoros/1
  # GET /pomodoros/1.xml
  def show
    @pomodoro = Pomodoro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pomodoro }
    end
  end

  # GET /pomodoros/new
  # GET /pomodoros/new.xml
  def new
    @pomodoro = Pomodoro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pomodoro }
    end
  end

  # GET /pomodoros/1/edit
  def edit
    @pomodoro = Pomodoro.find(params[:id])
  end

  # POST /pomodoros
  # POST /pomodoros.xml
  def create
    @pomodoro = Pomodoro.new(params[:pomodoro])

    respond_to do |format|
      if @pomodoro.save
        flash[:notice] = 'Pomodoro was successfully created.'
        format.html { redirect_to(@pomodoro) }
        format.xml  { render :xml => @pomodoro, :status => :created, :location => @pomodoro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pomodoro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pomodoros/1
  # PUT /pomodoros/1.xml
  def update
    @pomodoro = Pomodoro.find(params[:id])

    respond_to do |format|
      if @pomodoro.update_attributes(params[:pomodoro])
        flash[:notice] = 'Pomodoro was successfully updated.'
        format.html { redirect_to(@pomodoro) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pomodoro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pomodoros/1
  # DELETE /pomodoros/1.xml
  def destroy
    @pomodoro = Pomodoro.find(params[:id])
    @pomodoro.destroy

    respond_to do |format|
      format.html { redirect_to(pomodoros_url) }
      format.xml  { head :ok }
    end
  end
end
