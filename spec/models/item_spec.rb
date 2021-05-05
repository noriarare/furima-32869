require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    before do
      @item.image = fixture_file_upload('app/assets/images/star.png')
    end
    context "商品出品機能" do
      it "全ての情報が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "登録できない時" do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "catch_copyが空では登録できない" do
        @item.catch_copy = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Catch copy can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_idが空では登録できない" do
        @item.shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "from_idが空では登録できない" do
        @item.from_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("From can't be blank")
      end
      it "day_idが空では登録できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字では登録できない" do
        @item.price = "９９９９"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが299以下では登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが10000000以上では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "category_idが1では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが1では登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "shipping_idが1では登録できない" do
        @item.shipping_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it "from_idが1では登録できない" do
        @item.from_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("From must be other than 1")
      end
      it "day_idが1では登録できない" do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
    end
  end
end
