class Item < ApplicationRecord
  validates :is_active, inclusion: { in: [true, false] }

  belongs_to :genre
end
