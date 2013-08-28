Before('@blank_user') do
  @user = User.create( :first_name => 'Jordan',
                        :last_name => 'Nemrow',
                        :email => 'nemrowj@gmail.com',
                        :password => 'password'
                      )
end

Before('@campaign_owner') do
  @campaign = Campaign.create(  :name => 'My First Campaign',
                                :description => 'My first description',
                                :deadline => Time.now + 30.days
                              )
  @user.owned_campaigns << @campaign
end