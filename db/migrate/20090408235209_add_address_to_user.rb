class AddAddressToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :town, :string
    add_column :users, :county, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
  end

  def self.down
    remove_column :users, :country
    remove_column :users, :postcode
    remove_column :users, :county
    remove_column :users, :town
    remove_column :users, :address2
    remove_column :users, :address1
  end
end
