# -*- encoding : utf-8 -*-
require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :tasks, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :name,  :format     => { :with => Authentication.name_regex, :message => Authentication.bad_name_message },
                    :length     => { :maximum => 100 },
                    :allow_nil  => true

  validates :email, :presence   => true,
                    :uniqueness => true,
                    :format     => { :with => Authentication.email_regex, :message => Authentication.bad_email_message },
                    :length     => { :within => 6..100 }

  before_create :make_activation_code 

  attr_accessible :email, :name, :password, :password_confirmation

  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    u = where(['email = ? and activated_at IS NOT NULL', email]).first # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(:validate => false)
  end

  def active?
    activation_code.nil?
  end  

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end  

  def recently_activated?
    @activated
  end

  protected
    
  def make_activation_code
    self.activation_code = self.class.make_token
  end


end
