# -*- encoding : utf-8 -*-
class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.text :details

      t.timestamps
    end
    add_index :companies, :name
  end

  def self.down
    remove_index :companies, :name
    drop_table :companies
  end
end
