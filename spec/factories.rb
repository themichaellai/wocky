FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :track do
    sequence(:name) { |n| "Song #{n}" }
    sequence(:artist) { |n| "Artist #{n}" }
    sequence(:spotify_uri) { |n| "spotify://#{n}" }
    user
  end
end
