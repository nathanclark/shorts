class CreateSnapshots < ActiveRecord::Migration
  def self.up
    create_table :snapshots do |t|
      t.string :checksum
      t.string :image_thumb
      t.string :image
      t.integer :site_id
      t.boolean :alert_sent
      t.timestamps
    end
  end

  def self.down
    drop_table :snapshots
  end
end
