class Item < ApplicationRecord
  validates :is_active, inclusion: { in: [true, false] }
  has_many :cart_items
  belongs_to :genre
  has_many :order_details

  attachment :image
end
