require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'buildingが空でも登録できる' do
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'クレジットカードの情報を正しく入力しないと保存できないこと' do
      end
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'addressesが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'phone_numberが10桁か11桁の正しい形式でないと保存できないこと' do
      end
    end
  end
end
