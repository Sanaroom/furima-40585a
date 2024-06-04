class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :user
    validates :name
    validates :description
    validates :category_id
    validates :item_statue_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
    validates :favo
  end

  
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }


  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments
  
  def self.search(search)
    if search != ""
      Item.where('description LIKE(?) OR name LIKE(?) ',"%#{search}%","%#{search}%")
    else
      Item.all
    end
  end

  def previous_item
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next_item
    Item.where("id > ?", self.id).order("id asc").first
  end

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

  def self.ransackable_attributes(auth_object = nil)
    ["name", "price", "category_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
