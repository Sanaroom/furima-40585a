class Item < ApplicationRecord
  validates :user, presence: true
  validates :name, presence: true, uniqueness: true  
  validates :category_id, presence: true
  validates :item_statue_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :description, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one :order
  has_many :comments

end
