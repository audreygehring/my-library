FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Harry Potter and the Sorcerer's Stone #{n}" }
    sequence(:publication_date) { |n| "May 17, 2015 #{n}" }
    description "This is the best book of all time."
    pages 224
    sequence(:author) { |n| "J.K. Rowling #{n}" }
  end
end
