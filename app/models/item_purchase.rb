class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token, :postial_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postial_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    SendAddress.create(postial_code: postial_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
