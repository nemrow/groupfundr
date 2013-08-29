# create master user
@user = User.create(:first_name => 'Jordan',
            :last_name => 'Nemrow',
            :email => 'nemrowj@gmail.com',
            :password => 'password'
            )

# create campaign
@campaign = Campaign.create(:name => 'My First Campaign',
                            :description => 'This is a sweet campaign',
                            :deadline => Time.now + 30.days
                            )
@user.owned_campaigns << @campaign

10.times do
  invite = Invite.create( :name => Faker::Name.name,
                          :email => Faker::Internet.email
                        )
  @campaign.invites << invite
end

10.times do
  user = User.create(:first_name => Faker::Name.first_name,
              :last_name => Faker::Name.last_name,
              :email => Faker::Internet.email,
              :password => 'password'
              )
  user.joined_campaigns << @campaign
end