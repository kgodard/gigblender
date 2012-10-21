# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    name "MyString"
    website "MyString"
    phone "MyString"
    covers_percentage "MyString"
    description "MyText"
    available_sunday false
    available_monday false
    available_tuesday false
    available_wednesday false
    available_thursday false
    available_friday false
    available_saturday false
    user_id 1
    zipcode_id 1
    image "MyString"
  end
end
