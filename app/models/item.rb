# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  acts_as_list
  belongs_to :task
  
  before_create :set_position_to_last
  
  protected
  
  def set_position_to_last
    last_position = self.task.items.maximum("position") || 0
    self.position = last_position + 1
  end
end
