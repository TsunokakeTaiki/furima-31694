class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
  end

end
