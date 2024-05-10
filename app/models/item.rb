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
  has_one_attached :image
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_statue
  validates :item_statue_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_date
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}  
end
