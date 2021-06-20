require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入機能' do
    context '購入機能' do
      it 'token,post,form_id,municipality,house_number,telが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'bildingが空白でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない時' do
      #郵便番号post
      it '郵便番号postが空では登録できない' do
        @order_address.post = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post can't be blank")
      end
      it '郵便番号postに - がなければ登録できない' do
        @order_address.post = '5555555'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post is invalid")
      end
      it '郵便番号postが全角ならば登録できない' do
        @order_address.post = '５５５-５５５５'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post is invalid")
      end
      it '郵便番号postが3桁-4桁出なければ登録できない' do
        @order_address.post = '55-55555'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post is invalid")
      end
      #都道府県from_id
      it '都道府県from_idが空では登録できない' do
        @order_address.from_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("From can't be blank")
      end
      it '都道府県from_idが初期設定(1)では登録できない' do
        @order_address.from_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("From must be other than 1")
      end
      #市区町村municipality
      it '市区町村municipalityが空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      #番地house_number
      it '番地house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      #電話番号tel
      it '電話番号telが空では登録できない' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号telが全角では登録できない' do
        @order_address.tel = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号telが-を含むと登録できない' do
        @order_address.tel = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
      #トークンtoken
      it 'トークンが空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end


end
