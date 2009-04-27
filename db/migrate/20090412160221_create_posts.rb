class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :forum_username
      t.string :type
      t.datetime :date
      t.boolean :flag

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
