FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "My#{n}Product" }
    sequence(:description) { |n| "My#{n}Description" }
  end

end
