class SendAddress < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1 } 


end
