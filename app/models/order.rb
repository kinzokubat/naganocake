class Order < ApplicationRecord
  
  
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :name, presence: true
  
  
  
  enum city: {
    自分の住所: 0,
    登録した住所: 1,
    新しい住所: 2
  }
  
  enum payment_method: { クレジットカード: 0, 銀行振込み: 1 }

  enum status: {
    wait: 0,
    pay_confirm: 1,
    making: 2,
    preparing_to_ship: 3,
    complete: 4,
  }  
  has_many :order_details
  belongs_to :costomer
  
end
