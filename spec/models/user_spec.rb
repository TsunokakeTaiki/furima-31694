require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが40文字以下で登録できる" do
        @user.nickname = Faker::Name.initials(number: 40)
        expect(@user).to be_valid
      end
      it "passwordが英数字6文字以上であれば登録できる" do
        @user.password = "a12345"
        @user.password_confirmation = "a12345"
        expect(@user).to be_valid
      end
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "テスト"
        expect(@user).to be_valid
      end
      it "last_nameが全角であれば登録できる" do
        @user.last_name = "テスト"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = "テスト"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カタカナであれば登録できる" do
        @user.last_name_kana = "テスト"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが40文字以上であれば登録できない" do
        @user.nickname = Faker::Name.initials(number: 41)
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")      
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "1234a"
        @user.password_confirmation = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")      
      end
      it "passwordが英数字混在でなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")  
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")      
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "tesuto"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "tesuto"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = "tesuto"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
      it "first_name_kanaが全角カタカナ以外では登録できない" do
        @user.first_name_kana = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = "tesuto"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
      it "last_name_kanaが全角カタカナでは登録できない" do
        @user.last_name_kana = "ﾃｽﾄ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end