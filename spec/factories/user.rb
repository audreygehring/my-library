FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Arya #{n}" }
    sequence(:last_name) { |n| "Stark #{n}" }
    description "Arya is a book-lover from Winterfell!"
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
