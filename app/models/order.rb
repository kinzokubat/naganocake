class Order < ApplicationRecord
  enum payment_method: { クレジットカード: 0, 銀行振込み: 1 }
  # enum status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み:4 }
  
  
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
