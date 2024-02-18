# spec/factories/detail.rb
FactoryBot.define do
  factory :detail do
    email { 'john@example.com' }
    age { 25 }
    phone { '123-456-7890' }
  end
end
