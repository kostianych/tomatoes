class ActivityInventoriesController < ApplicationController
  # GET /activity_inventories
  # GET /activity_inventories.xml
  def index
    @activity_inventories = ActivityInventory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activity_inventories }
    end
  end

  # GET /activity_inventories/1
  # GET /activity_inventories/1.xml
  def show
    @activity_inventory = ActivityInventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity_inventory }
    end
  end

  # GET /activity_inventories/new
  # GET /activity_inventories/new.xml
  def new
    @activity_inventory = ActivityInventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity_inventory }
    end
  end

  # GET /activity_inventories/1/edit
  def edit
    @activity_inventory = ActivityInventory.find(params[:id])
  end

  # POST /activity_inventories
  # POST /activity_inventories.xml
  def create
    @activity_inventory = ActivityInventory.new(params[:activity_inventory])

    respond_to do |format|
      if @activity_inventory.save
        flash[:notice] = 'ActivityInventory was successfully created.'
        format.html { redirect_to(@activity_inventory) }
        format.xml  { render :xml => @activity_inventory, :status => :created, :location => @activity_inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activity_inventories/1
  # PUT /activity_inventories/1.xml
  def update
    @activity_inventory = ActivityInventory.find(params[:id])

    respond_to do |format|
      if @activity_inventory.update_attributes(params[:activity_inventory])
        flash[:notice] = 'ActivityInventory was successfully updated.'
        format.html { redirect_to(@activity_inventory) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_inventories/1
  # DELETE /activity_inventories/1.xml
  def destroy
    @activity_inventory = ActivityInventory.find(params[:id])
    @activity_inventory.destroy

    respond_to do |format|
      format.html { redirect_to(activity_inventories_url) }
      format.xml  { head :ok }
    end
  end
end
