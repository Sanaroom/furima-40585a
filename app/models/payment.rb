class Payment < ApplicationRecord
  validates :order, presence: true
  validates :postcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
  
  belongs_to :order
end
