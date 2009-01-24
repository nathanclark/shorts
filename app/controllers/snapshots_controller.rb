class SnapshotsController < ApplicationController
  # GET /snapshots
  # GET /snapshots.xml
  def index
    @snapshots = Snapshot.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snapshots }
    end
  end

  # GET /snapshots/1
  # GET /snapshots/1.xml
  def show
    @snapshot = Snapshot.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @snapshot }
    end
  end

  # GET /snapshots/new
  # GET /snapshots/new.xml
  def new
    @snapshot = Snapshot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snapshot }
    end
  end

  # GET /snapshots/1/edit
  def edit
    @snapshot = Snapshot.find(params[:id])
  end

  # POST /snapshots
  # POST /snapshots.xml
  def create
    @snapshot = Snapshot.new(params[:snapshot])

    respond_to do |format|
      if @snapshot.save
        flash[:notice] = 'Snapshot was successfully created.'
        format.html { redirect_to(@snapshot) }
        format.xml  { render :xml => @snapshot, :status => :created, :location => @snapshot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @snapshot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /snapshots/1
  # PUT /snapshots/1.xml
  def update
    @snapshot = Snapshot.find(params[:id])

    respond_to do |format|
      if @snapshot.update_attributes(params[:snapshot])
        flash[:notice] = 'Snapshot was successfully updated.'
        format.html { redirect_to(@snapshot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snapshot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snapshots/1
  # DELETE /snapshots/1.xml
  def destroy
    @snapshot = Snapshot.find(params[:id])
    @snapshot.destroy

    respond_to do |format|
      format.html { redirect_to(snapshots_url) }
      format.xml  { head :ok }
    end
  end
  
  def send_alerts
    
  end
  
  def grab_screenshots
    @snapshots = Snapshot.find_all_by_alert_sent false
    @snapshots.each do |shot|
      shot.get_screenshots
    end
  end
end
