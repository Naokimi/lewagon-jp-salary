FactoryBot.define do
  factory :salary do
    amount { 1 }
    graduation { "2022-01-29 18:41:09" }
    role_name { "MyString" }
    remote { 1 }
    flex { 1 }
    equity { false }
    workweek { 1 }
    overtime { 1 }
  end
end
