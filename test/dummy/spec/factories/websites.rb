# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :website do
    headline  { Faker::Lorem.sentence(7) }
    body { Faker::HTMLIpsum.body }
    keywords { Faker::HTMLIpsum.ul_links }
    head  { Faker::HTMLIpsum.ul_links }
    active { [true, false].sample }
  end
end
