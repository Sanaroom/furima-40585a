class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :city
  validates :block
  validates :token
  end

  
  # [3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
  validates :postcode, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
 
  # 10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  
  def save
    order = Order.create(user_id:, item_id:)
    Payment.create(order_id: order.id, postcode:, prefecture_id:, city:, block:, building:,
                   phone_number:)
  end
end
