class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.integer :site_id

      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
