# == Schema Information
# Schema version: 20090105013409
#
# Table name: sites
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     
#  url        :string(255)     
#  intervals  :integer(4)      
#  enabled    :boolean(1)      
#  created_at :datetime        
#  updated_at :datetime        
#

class Site < ActiveRecord::Base
  has_many :snapshots
end
