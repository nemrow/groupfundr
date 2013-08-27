# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence :email do |n|
      "email#{n}@factory.com"
    end
    password "password"
  end
end
