class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :price
  end

end
