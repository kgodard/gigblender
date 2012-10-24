# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    sequence(:name) { |n| "Artist #{n}" }
    sequence(:website) { |n| "www.artist_#{n}.com" }
    phone "333-333-3333"
    covers_percentage "no covers"
    description "We are super awesome"
    available_sunday true
    available_monday true
    available_tuesday true
    available_wednesday true
    available_thursday true
    available_friday true
    available_saturday true
    association :user
    association :zipcode
    image ""
  end
end
