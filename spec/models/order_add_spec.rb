require 'rails_helper'

RSpec.describe OrderAdd, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_add = FactoryBot.build(:order_add, user_id: @user.id, item_id: @item.id, token: 'tok_abcdefghijk00000000000000000')
    sleep(0.2)
  end

  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@order_add).to be_valid
      end
      it 'address_line_subは空でも保存できる' do
        @order_add.address_line_sub = ''
        expect(@order_add).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'postal_codeが空では保存できない' do
        @order_add.postal_code = ''
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @order_add.postal_code = '1234567'
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では保存できない' do
        @order_add.prefecture_id = 1
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_add.city = ''
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("City can't be blank")
      end
      it 'address_line_mainが空では保存できない' do
        @order_add.address_line_main = ''
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("Address line main can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_add.phone_number = ''
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上でなければ保存できない' do
        @order_add.phone_number = 123_456_789
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが11桁以内でなければ保存できない' do
        @order_add.phone_number = 123_456_789_012
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが半角数字でないと保存できない' do
        @order_add.phone_number = '１２３４５６７８９０'
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'tokenが空では登録できないこと' do
        @order_add.token = nil
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order_add.user_id = nil
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_add.item_id = nil
        @order_add.valid?
        expect(@order_add.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
