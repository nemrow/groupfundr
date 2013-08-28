Before('@blank_user') do
  @user = User.create( :first_name => 'Jordan',
                        :last_name => 'Nemrow',
                        :email => 'nemrowj@gmail.com',
                        :password => 'password'
                      )
end