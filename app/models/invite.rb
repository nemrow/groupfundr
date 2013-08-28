require 'securerandom'

class Invite < ActiveRecord::Base
  attr_accessible :campaign_id, :email, :expired, :message, :name

  belongs_to :campaign

  before_save :generate_token, :set_expired

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  # callbacks cannot return false hence the 'true' after assignment
  def set_expired
    self.expired = false
    true
  end
end
