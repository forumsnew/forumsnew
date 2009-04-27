class AddThingsToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :forum_url, :string
    add_column :orders, :forum_title, :string
  end

  def self.down
    remove_column :orders, :forum_title
    remove_column :orders, :forum_url
  end
end
