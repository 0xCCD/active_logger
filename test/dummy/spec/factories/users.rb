# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    encrypted_password "MyString"
    last_login_at { Time.now }
    remember_created_at { Time.now }
    active false
  end
end
