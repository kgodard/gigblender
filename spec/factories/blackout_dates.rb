# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blackout_date do
    bdate "2012-10-23"
    artist_id 1
  end
end
