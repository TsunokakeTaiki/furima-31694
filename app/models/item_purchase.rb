class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end