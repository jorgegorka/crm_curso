# -*- encoding : utf-8 -*-
class Person < ActiveRecord::Base
  belongs_to :company
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  validates :name, :presence => true,
                   :uniqueness => {:scope => :company_id, :message => "no puede repetirse dentro de la misma empresa"},
                   :length => {:minimum => 3}
  validates_length_of :title, :allow_blank => true, :minimum => 3
end
