class AddCountryIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :country_id, :integer
    add_column :users, :paypal, :string
  end

  def self.down
    remove_column :users, :paypal
    remove_column :users, :country_id
  end
end
