require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/Users/tsunokaketaiki/project/furima-31694/app/assets/images/star.png')
  end

  describe '商品出品' do
    context '商品登録がうまくいくとき' do 
      it "image,name,info,price,が存在し、category,sales_status,shipping_fee_status,prefecture,scheduled_deliveryが１以外であれば登録できる" do
        expect(@item).to be_valid
      end
      it "nameが40文字以下で登録できる" do
        @item.name = Faker::Name.initials(number: 40)
        expect(@item).to be_valid
      end
      it "infoが1000文字以下で登録できる" do
        @item.info = Faker::Name.initials(number: 1000)
        expect(@item).to be_valid
      end
      it "priceが300以上で登録できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "priceが9,999,999以下で登録できる" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字以上では登録できない" do
        @item.name = Faker::Name.initials(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "infoが空では登録できない" do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it "infoが1000文字以上では登録できない" do
        @item.info = Faker::Name.initials(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Info is too long (maximum is 1000 characters)")
      end
      it "category_idが１では登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "sales_status_idが１では登録できない" do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be other than 1")
      end
      it "shipping_fee_status_idが１では登録できない" do
        @item.shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
      end
      it "prefecture_idが１では登録できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "scheduled_delivery_idが１では登録できない" do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300以下では登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300〜9,999,999の範囲で入力してください")
      end
      it "priceが9,999,999以上では登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300〜9,999,999の範囲で入力してください")
      end
    end
  end
end
