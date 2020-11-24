require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる" do
      end
      it "nicknameが40文字以下で登録できる" do
      end
      it "passwordが英数字6文字以上であれば登録できる" do
      end
      it "first_nameが全角であれば登録できる" do
      end
      it "last_nameが全角であれば登録できる" do
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
      end
      it "last_name_kanaが全角カタカナであれば登録できる" do

    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "nicknameが40文字以上であれば登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが英数字混在でなければ登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "first_nameが半角では登録できない" do
      end
      it "last_nameが空では登録できない" do
      end
      it "last_nameが半角では登録できない" do
      end
      it "first_name_kanaが空では登録できない" do
      end
      it "first_name_kanaが半角では登録できない" do
      end
      it "first_name_kanaが全角カタカナ以外では登録できない" do
      end
      it "last_name_kanaが空では登録できない" do
      end
      it "last_name_kanaが半角では登録できない" do
      end
      it "last_name_kanaが全角カタカナでは登録できない" do
      end
      it "birth_dateが空では登録できない" do
      end
    end
  end
end