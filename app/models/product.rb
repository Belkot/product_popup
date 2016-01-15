class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
end
