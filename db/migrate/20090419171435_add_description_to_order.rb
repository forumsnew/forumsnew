class AddDescriptionToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :desctiption, :text
  end

  def self.down
    remove_column :orders, :desctiption
  end
end
