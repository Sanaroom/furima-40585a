class ItemOrder
  include ActiveModel::Model
  attr_accessor :user, :item, :postcode, :prefecture_id, :city, :block, :building, :phone_number,:token

  # orderモデル
  validates :user, presence: true
  validates :item, presence: true

  # paymentモデル
  validates :postcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
  #トークン
  validates :token, presence: true

  def save
   order=Order.create(user_id: user_id, item_id: item_id)
   Payment.create(order:order,postcode:postcode, prefecture_id:prefecture_id, city:city, block:block, building:building, phone_number:phone_number)
  end
end