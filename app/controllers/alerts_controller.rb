class AlertsController < ApplicationController
  def send_alert
  end

  def grab_screenshots
    @snapshots = Snapshot.find_all_by_alert_sent false
    @snapshots.each do |shot|
      shot.get_screenshots
    end
  end
  
  def index
    render :text => 'test'
  end

end
