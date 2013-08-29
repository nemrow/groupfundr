module Mailgun

  def self.send_basic_letter(to, subject, content)
    send_letter(to, subject, content)
  end

  def self.send_invite(invite)
    send_letter(  invite.email,
                  "Join Our Campaign",
                  "You have been invited to join the #{invite.campaign}\'s campaign. Please click the link: " + 
                  invite.get_invite_url,
                  "Jordan@Groupfundr.com")
  end

  protected
  def self.send_letter(to, subject, content, from)
    RestClient.post ENV['MAILGUN_URL']+"/messages", 
        :from => from,
        :to => to,
        :subject => subject,
        :text => content
        # :html => "<b>HTML</b> version of the body!"
  end
end