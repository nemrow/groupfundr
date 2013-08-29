require 'securerandom'

class Invite < ActiveRecord::Base
  attr_accessible :campaign_id, :email, :expired, :message, :name

  belongs_to :campaign

  before_create :generate_token, :set_expired

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  # callbacks cannot return false hence the 'true' after assignment
  def set_expired
    self.expired = false
    true
  end

  def get_invite_url
    ENV['BASE_URL'] + 
    'invites/' +
    "#{id}?" +
    'token=' +
    token
  end

  def self.set_campaign_to_user(invited_hash, user)
    invite = Invite.find(invited_hash['id'])
    if invite.token == invited_hash['token']
      user.joined_campaigns << invite.campaign
      invite.update_attributes(:expired => true)
    end
  end
end
