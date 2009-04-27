class AddPerPostToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :per_post, :integer
  end

  def self.down
    remove_column :users, :per_post
  end
end
