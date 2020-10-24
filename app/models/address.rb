class Address < ApplicationRecord
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true


  def street
    self.postal_code + self.address + self.name
  end

end
