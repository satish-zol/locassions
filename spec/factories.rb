#require 'faker'

FactoryGirl.define do
  factory :user do |user|
    user.name 'Testy'
    user.email 'testy@example.com'
    user.password 'password'
  end
  
  factory :event do |event|
    event.name "New Event"
    user
  end
end
