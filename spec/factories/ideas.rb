FactoryBot.define do
  factory :idea do
    title { Faker::ProgrammingLanguage.name }
    description { Faker::Lorem.sentence(30) }
    association(:user, factory: :user)
  end
end
