# -*- encoding : utf-8 -*-
class AddLevelUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :level, :integer, :default => 1
    User.update_all("level=1")
  end

  def self.down
    remove_column :users, :level
  end
end
