require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context 'ユーザー新規登録' do
        it 'nickname,email,password,password_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end
        it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
          @user.password = 'a1b2c3'
          @user.password_confirmation = 'a1b2c3'
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
        it 'passwordが存在してもpassword_confirmationが空では登録でき無い' do
          @user.password = 'a1b2c3'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = 'a1b2c'
          @user.password_confirmation = 'a1b2c'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "a1b2c3"
          @user.password_confirmation = "a1b2c3d"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが英数半角(英字のみ)を含まないと登録できないこと" do
          @user.password = 'aaaaaa'
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
        it "passwordが英数半角(数字のみ)を含まないと登録できないこと" do
          @user.password = '123456'
          @user.password_confirmation = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
        it 'last_nameが空では登録できないこと' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'last_nameが漢字・平仮名・片仮名以外では登録できないこと' do
          @user.last_name = 'aa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is not used kanji,hiragana,katakana")
        end
        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameが漢字・平仮名・片仮名以外では登録できないこと' do
          @user.first_name = 'aa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is not used kanji,hiragana,katakana")
        end
        it 'last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'last_name_kanaは片仮名以外だと登録できないこと' do
          @user.last_name_kana = 'aあ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is not used katakana")
        end
        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'first_name_kanaは片仮名以外だと登録できないこと' do
          @user.first_name_kana = 'aあ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is not used katakana")
        end
        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        it '重複したemailが存在する場合は新規登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@が含まれていないと登録できないこと' do
          @user.email = 'a1a1a1a1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

      end

    end
end
