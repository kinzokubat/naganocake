class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :costomer
  validates :amount, presence: true
end
