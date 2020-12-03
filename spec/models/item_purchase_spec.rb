require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_purchase).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @item_purchase.building = nil
        expect(@item_purchase).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'クレジットカードの情報を正しく入力しないと保存できないこと' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @item_purchase.postial_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postial code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_purchase.postial_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postial code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @item_purchase.prefecture_id = '1'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @item_purchase.addresses = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁か11桁の正しい形式でないと保存できないこと' do
        @item_purchase.phone_number = '123456789'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
