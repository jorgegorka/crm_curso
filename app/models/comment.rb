class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  
  validates_presence_of :details
  
  attr_accessible :details
  
  def self.last_comments
    order("created_at desc")
  end
  
end