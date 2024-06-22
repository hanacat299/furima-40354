require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    @orderform = FactoryBot.build(:orderform)
  end

  describe '商品購入機能' do

    context '商品が購入できるとき' do
      it 'postal_code,prefecture_id,city,street_address,phone_number,orderが存在すれば登録できる' do
       expect(@orderform).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'postal_codeが空では保存できない' do
        @orderform.postal_code = ""
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("PostalCode can't be blank")
      end

      it 'posta_codeは3桁ハイフン4桁の半角文字列以外では保存できない' do
        @orderform.postal_code = "123456"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code is invalid. Include hyphen")
      end

      it 'prefecture_idが1では保存できない' do
        @orderform.prefecture_id = "1"
        @orderform.valid?
        expect(@orderForm.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では保存できない' do
        @orderform.city = ""
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空では保存できない' do
        @orderform.street_address = ""
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @orderform.phone_number = ""
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数字以外では保存できない' do
        @orderform.phone_number = "abcdf"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end

    end

end
