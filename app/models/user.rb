class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password

  has_many :owned_campaigns, :class_name => 'Campaign', :foreign_key => 'owner_id'
  has_many :joined_campaigns, :through => :user_joined_campaigns, :source => :campaign
  has_many :user_joined_campaigns

  has_secure_password
end
