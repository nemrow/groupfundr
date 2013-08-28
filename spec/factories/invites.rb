# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invite do
    name "Jay Nems"
    email "nems@nems.com"
    message "I would like to invite you to my campaign"
  end
end
