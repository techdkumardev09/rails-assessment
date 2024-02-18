FactoryBot.define do
  factory :person do
    name { 'John Doe' }
    after(:build) do |person|
      person.detail ||= build(:detail, person: person)
    end
  end
end
