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
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :price
  end

end
