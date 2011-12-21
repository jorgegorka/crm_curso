# -*- encoding : utf-8 -*-
class Task < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :approved_comments, :as => :commentable, :class_name => "Comment", :dependent => :destroy, :conditions => {:approved => true }
  has_many :items, :dependent => :destroy
  
  validate :date_less_than_one_year_from_now
  
  attr_protected :user_id
  
  protected

  def date_less_than_one_year_from_now
    errors.add(:finished_on, "No puedes poner tareas con fecha de fin mayor que un año.") if (!self.finished_on.blank? and (self.finished_on.to_time.utc > 1.year.from_now))
  end
  
end
