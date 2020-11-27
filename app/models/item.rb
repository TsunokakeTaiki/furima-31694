class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :info, presence: true, length: { maximum: 1000 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price, presence: true,
  :numericality => {
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 9999999,
    :message => '¥300〜9,999,999の範囲で入力してください' 
  }

end
