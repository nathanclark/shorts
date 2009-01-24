class Site < ActiveRecord::Base
  has_many :snapshots
end
