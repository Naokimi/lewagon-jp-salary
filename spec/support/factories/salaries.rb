FactoryBot.define do
  factory :salary do
    amount { 2_000_001 }
    year { 2022 }
    job_title { 'Backend Developer' }
    remote { 1 }
    flex { 1 }
    equity { false }
    workweek { 1 }
    overtime { 1 }
  end
end
