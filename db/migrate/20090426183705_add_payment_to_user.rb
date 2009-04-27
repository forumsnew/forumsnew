class AddPaymentToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :payment, :integer
  end

  def self.down
    remove_column :users, :payment
  end
end
