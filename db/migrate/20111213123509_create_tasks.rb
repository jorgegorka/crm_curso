# -*- encoding : utf-8 -*-
class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.belongs_to :category, :user
      t.string     :title
      t.date       :finished_on
      t.boolean    :public, :default => false
      t.timestamps
    end
    add_index :tasks, :category_id
    add_index :tasks, :user_id
  end

  def self.down
    remove_index :tasks, :user_id
    remove_index :tasks, :category_id
    drop_table :tasks
  end
end