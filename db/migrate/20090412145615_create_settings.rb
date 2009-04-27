class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :site_name
      t.boolean :beta
      t.decimal :per_post

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
