class Campaign < ActiveRecord::Base
  attr_accessible :deadline, :description, :group_raised, :name, :owner_id

  belongs_to :owner, :foreign_key => 'owner_id', :class_name => 'User'
  has_many :participants, :through => :user_joined_campaigns, :source => :user
  has_many :user_joined_campaigns
  has_many :invites
end
