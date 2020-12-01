class Purchase < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token

  belongs_to :item
  belongs_to :user
  has_one :send_address

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
