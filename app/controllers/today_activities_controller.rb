class TodayActivitiesController < ApplicationController
  # GET /today_activities
  # GET /today_activities.xml
  def index
    @today = Date.today
    puts @today
    @today_activities = TodayActivity.find(:all, 
      :conditions => "today = '" + @today.to_s() +"'")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @today_activities }
    end
  end
  
  def reload
    puts "reload"   
    #@today = Date.today
    puts "---Start----"
    puts params[:start]
    puts "-------------"
    date = Date.civil(params[:start][:year].to_i, params[:start][:month].to_i, params[:start][:day].to_i) 
    puts "---Date----"
    puts date.to_s
    puts "-------------"

    @today_activities = TodayActivity.find(:all, 
      :conditions => "today = '" + date.to_s() +"'",
      :joins => ", activities as a on today_activities.activity_id = a.id",
      :order => "a.priority")
    puts @today_activities.count  
    render :template => "today_activities/_table", :object => @today_activities
  end
  
  def popup 
    puts "popup"
    #render :partial => '/today_activities/popin'
  end

  def popin 
    puts "popin"
    #render :partial => '/today_activities/popout'
  end
 


  # GET /today_activities/1
  # GET /today_activities/1.xml
  def show
    @today_activity = TodayActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @today_activity }
    end
  end

  # GET /today_activities/new
  # GET /today_activities/new.xml
  def new
    @today_activity = TodayActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @today_activity }
    end
  end

  # GET /today_activities/1/edit
  def edit
    @today_activity = TodayActivity.find(params[:id])
  end

  # POST /today_activities
  # POST /today_activities.xml
  def create
    @today_activity = TodayActivity.new(params[:today_activity])

    respond_to do |format|
      if @today_activity.save
        flash[:notice] = 'TodayActivity was successfully created.'
        format.html { redirect_to(@today_activity) }
        format.xml  { render :xml => @today_activity, :status => :created, :location => @today_activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @today_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /today_activities/1
  # PUT /today_activities/1.xml
  def update
    @today_activity = TodayActivity.find(params[:id])

    respond_to do |format|
      if @today_activity.update_attributes(params[:today_activity])
        flash[:notice] = 'TodayActivity was successfully updated.'
        format.html { redirect_to(@today_activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @today_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /today_activities/1
  # DELETE /today_activities/1.xml
  def destroy
    @today_activity = TodayActivity.find(params[:id])
    @today_activity.destroy

    respond_to do |format|
      format.html { redirect_to(today_activities_url) }
      format.xml  { head :ok }
    end
  end
end
