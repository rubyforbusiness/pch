FactoryBot.define do
  factory :audit do
    created_at { "2024-10-05 17:36:51" }
    auditable_id { 1 }
    auditable_type { "MyString" }
  end
end
