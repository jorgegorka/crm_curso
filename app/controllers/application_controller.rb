# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  
  protect_from_forgery  
end
