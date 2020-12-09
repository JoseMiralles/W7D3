FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    # session_token { "MyString" }
    # password_digest { "MyString" }
    # password { Faker::Movies::HarryPotter.spell }
    password { "onering" }
  end
end