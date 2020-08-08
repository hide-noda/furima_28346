require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "name,email,password,password_confirmation,family_name,last_name,family_name_kana,last_name_kana,birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数混合で登録できる" do
        @user.password = "000ppp"
        @user.password_confirmation = "000ppp"
        expect(@user).to be_valid
      end
      it "family_name,last_nameが全角の漢字、カタカナ、ひらがなで登録できる" do
        @user.family_name = "漢字カナかな"
        @user.last_name = "漢字カナかな"
        expect(@user).to be_valid
      end
      it "family_name_kana,last_name_kanaが全角カタカナで登録できる" do
        @user.family_name_kana = "カナ"
        @user.last_name_kana = "カナ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailがある場合、登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在しても、password_confirmationが空だと登録できない" do
        @user.password = "000ppp"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "000pp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "family_nameが全角の漢字、カタカナ、ひらがなでないと登録できない" do
        @user.family_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "last_nameが全角の漢字、カタカナ、ひらがなでないと登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "family_name_kanaが全角カタカナでないと登録できない" do
        @user.family_name_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "last_name_kanaが全角カタカナでないと登録できない" do
        @user.last_name_kana = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
    end
  end
end
