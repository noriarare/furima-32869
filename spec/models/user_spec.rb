require 'rails_helper'

RSpec.describe User, type: :model do
  #describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context 'ユーザー新規登録' do
        it 'nickname,email,password,password_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end
        it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end
        it 'password:半角英数混合であれば登録できる' do
          @user.password = 'a0a0a0'
          @user.password_confirmation = 'a0a0a0'
          expect(@user).to be_valid
        end
      end

      context '新規登録できない時' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録でき無し' do
          @user.password = 'a0a0a0'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        
        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "123456"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameが空では登録できないこと' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end

    end
  #end
end
