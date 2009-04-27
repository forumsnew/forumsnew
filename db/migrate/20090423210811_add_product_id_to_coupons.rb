class AddProductIdToCoupons < ActiveRecord::Migration
  def self.up
    add_column :coupons, :product_id, :integer
  end

  def self.down
    remove_column :coupons, :product_id
  end
end
