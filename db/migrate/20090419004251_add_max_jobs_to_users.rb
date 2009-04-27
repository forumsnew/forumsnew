class AddMaxJobsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :max_jobs, :integer
  end

  def self.down
    remove_column :users, :max_jobs
  end
end
