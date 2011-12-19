# -*- encoding : utf-8 -*-
class Task < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :approved_comments, :as => :commentable, :class_name => "Comment", :dependent => :destroy, :conditions => {:approved => true }
  has_many :items, :dependent => :destroy
  
  validate :date_less_than_one_year_from_now
  
  protected

  def date_less_than_one_year_from_now
    errors.add(:finished_on, "no puede ser mayor de un año.") if (!finished_on.blank? and (finished_on > 1.year.from_now))
  end
end
