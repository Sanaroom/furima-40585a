class Order < ApplicationRecord
  attr_accessor :token
  validates :user, presence: true
  validates :item, presence: true
  validates :token, presence: true
  
  belongs_to :user
  belongs_to :item
  has_one :payment

end
