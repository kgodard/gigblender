# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'secret'
    password_confirmation 'secret'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end
end
