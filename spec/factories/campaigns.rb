# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name Faker::Company.name
    description Faker::Company.catch_phrase
    group_raised Random.rand(100.1000)
    deadline Time.now + (Random.rand(1..100)).days
  end
end
