FactoryBot.define do
  factory :salary do
    amount { 1 }
    year { 2022 }
    job_title { 'MyString' }
    remote { 1 }
    flex { 1 }
    equity { false }
    workweek { 1 }
    overtime { 1 }
  end
end
