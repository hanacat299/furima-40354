require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @orderform = FactoryBot.build(:order_form, user_id: @user.id, product_id: @product.id)
  end

  describe '商品購入機能' do

    context '商品が購入できるとき' do
      it 'postal_code,prefecture_id,city,street_address,phone_number,orderが存在すれば登録できる' do
       expect(@orderform).to be_valid
      end

      it 'building_nameが空でも保存できる' do
        @orderform.building_name = ""
        expect(@orderform).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'tokenが空では保存できない' do
        @orderform.token = ""
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では保存できない' do
        @orderform.postal_code = ""
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'posta_codeは3桁ハイフン4桁の半角文字列以外では保存できない' do
        @orderform.postal_code = "123456"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが1では保存できない' do
        @orderform.prefecture_id = "1"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture must be other than 1")
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

      it 'phone_numberが9桁以下では保存できない' do
        @orderform.phone_number = "123456789"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが12桁以上では保存できない' do
        @orderform.phone_number = "123456789012"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが半角数字以外が含まれると保存できない' do
        @orderform.phone_number = "abcdf"
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'user_idが空では保存できない' do
        @orderform.user_id = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空では保存できない' do
        @orderform.product_id = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Product can't be blank")
      end

    end

end

end
