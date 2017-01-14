FactoryGirl.define do
  factory :member do
    name     "MyString"
    email    {Faker::Internet.email}
    password {Devise.friendly_token.first(8)}
    account nil
  end
end
