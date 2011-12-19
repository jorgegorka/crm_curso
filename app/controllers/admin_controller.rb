# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  before_filter :login_required
end
