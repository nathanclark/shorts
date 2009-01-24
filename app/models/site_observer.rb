class SiteObserver < ActiveRecord::Observer
  observe :site
  def after_update(site)
    %x(touch #{RAILS_ROOT}/tmp/sites_updated.txt)
  end
  
  def after_create(site)
    %x(touch #{RAILS_ROOT}/tmp/sites_updated.txt)
  end
end
