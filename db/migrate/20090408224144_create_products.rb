class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :members
      t.integer :posts
      t.integer :threads
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
