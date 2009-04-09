# == Schema Information
# Schema version: 20090105013409
#
# Table name: snapshots
#
#  id                 :integer(4)      not null, primary key
#  checksum           :string(255)     
#  photo_file_name    :string(255)     
#  photo_content_type :string(255)     
#  photo_file_size    :integer(4)      
#  site_id            :integer(4)      
#  alert_sent         :boolean(1)      
#  created_at         :datetime        
#  updated_at         :datetime        
#

class Snapshot < ActiveRecord::Base
 belongs_to :site
  
  has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#"}
  
  
  def get_screenshots
    logger.info "getting screenshots for #{self.site.name}"
    t = Nailer.new(site.url)
    logger.info RAILS_ROOT 
    if t.ok?
      t.wait_until_ready
      path = "#{RAILS_ROOT}/tmp"
      image_path = "#{path}/#{checksum}.jpg"
            
      logger.info "Saving Thumbnail to #{image_path}"
      t.retrieve_to_file("#{image_path}", :large)
      
      self.photo = File.new image_path
      self.alert_sent = true
      self.save!
      client = Twitter::Client.new(:login => 'ping_shorts', :password => 'trump311')
      new_message = client.message(:post, "Site #{self.site.name} has changed http://shorts.local/sites/#{self.site.id}", 'nathan_clark')
      logger.info new_message.inspect
      logger.info "Thumbnails saved"
else
      logger.error "Error"
end
  end

end


