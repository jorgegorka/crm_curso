class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true
      t.belongs_to :user
      t.text       :details
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, :user_id
  end

  def self.down
    remove_index :comments, :user_id
    remove_index :comments, [:commentable_id, :commentable_type]
    drop_table :comments
  end
end