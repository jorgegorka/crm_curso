class AddCompletedToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :completed, :boolean, :default => false
  end

  def self.down
    remove_column :items, :completed
  end
end