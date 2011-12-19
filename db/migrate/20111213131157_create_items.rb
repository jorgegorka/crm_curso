# -*- encoding : utf-8 -*-
class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.belongs_to :task
      t.string     :title,     :limit => 100
      t.integer    :position, :default => 0
      t.timestamps
    end
    add_index :items, [:task_id, :position]
  end

  def self.down
    remove_index :items, [:task_id, :position]
    drop_table :items
  end
end
