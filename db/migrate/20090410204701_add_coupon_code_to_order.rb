class AddCouponCodeToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :cupon_code, :string
  end

  def self.down
    remove_column :orders, :cupon_code
  end
end
