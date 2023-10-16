FactoryBot.define do
  factory :blog do
    title { Faker::Book.title }
    decsription { Faker::Books::Lovecraft.sentence(word_count: 40) }
  end
end
