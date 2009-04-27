class AddDueToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :due, :string
  end

  def self.down
    remove_column :orders, :due
  end
end
