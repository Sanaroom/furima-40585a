class Item < ApplicationRecord
  with_options presence: true do
    validates :image, presence: true
    validates :user, presence: true
    validates :name, presence: true
    validates :description, presence: true
  end

  validates :category_id, presence: true
  validates :item_statue_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_statue
  validates :item_statue_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_date
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
