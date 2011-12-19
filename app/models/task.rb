# -*- encoding : utf-8 -*-
class Task < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :items, :dependent => :destroy
end
