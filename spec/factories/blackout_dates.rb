# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blackout_date do
    bdate { 30.days.from_now }
    association :artist
  end
end
