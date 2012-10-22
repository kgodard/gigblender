# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :zipcode do
    zipcode "MyString"
    primary_city "MyString"
    state "MyString"
    timezone "MyString"
    latitude "MyString"
    longitude "MyString"
  end
end
