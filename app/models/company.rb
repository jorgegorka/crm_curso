# -*- encoding : utf-8 -*-
class Company < ActiveRecord::Base
  has_many :people, :dependent => :destroy
  has_many :comments, :as => :commentable
  
  validates_presence_of :name
  
  validates_uniqueness_of :name
  
end
