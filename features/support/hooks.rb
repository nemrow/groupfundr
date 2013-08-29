Before('@blank_user') do
  @user = User.create(  :first_name => 'Jordan',
                        :last_name => 'Nemrow',
                        :email => 'nemrowj@gmail.com',
                        :password => 'password'
                      )
end

Before('@blank_participant ') do
  @participant = User.create(   :first_name => 'Barry',
                                :last_name => 'Nemrow',
                                :email => 'barry@nemrow.com',
                                :password => 'password'
                            )
end

Before('@campaign') do
  @campaign = Campaign.create(  :name => 'My First Campaign',
                                :description => 'My first description',
                                :deadline => Time.now + 30.days
                              )
  @user.owned_campaigns << @campaign
end

Before('@campaign_invite') do
  @invite = Invite.create(  :name => 'Barry',
                            :email => 'barry@nemrow.com'
                          )
  @campaign.invites << @invite
end