# -*- encoding : utf-8 -*-
class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.belongs_to :company
      t.string     :name, :limit => 100
      t.string     :title, :limit => 150
      t.text       :details
      t.string     :twitter, :limit => 30
      t.string     :linkedin
      t.timestamps
    end
    add_index :people, :company_id
    add_index :people, :name
  end

  def self.down
    remove_index :people, :company_id
    remove_index :people, :name
    drop_table :people
  end
end
