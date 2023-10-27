FactoryBot.define do
  factory :user do
    user_name              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a2b3c' }
    password_confirmation { password }
    department            { '総務部' }
    login_num             { '00001123' }
  end
end