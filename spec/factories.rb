#require 'faker'

FactoryGirl.define do
  factory :user do |user|
    user.name 'testy'
    user.email 'testy@example.com'
    user.password 'password'
  end
end
