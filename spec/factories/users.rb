FactoryBot.define do
  factory :user do
    sequence(:username) {|n| Faker::Name.first_name + "#{n}"}
    sequence(:email) {|n| Faker::Internet.email.sub("@", "#{n}@")}
    password { "asdf" }
  end
end
