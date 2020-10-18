class Item < ApplicationRecord
  validates :is_active, inclusion: { in: [true, false] }
end
