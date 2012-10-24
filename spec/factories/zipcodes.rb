# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zipcode do
    zipcode "80516"
    primary_city "Erie"
    state "CO"
    timezone "US/Mountain"
    latitude "0"
    longitude "0"
  end
end
