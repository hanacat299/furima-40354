require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
     @product = FactoryBot.build(:product)
  end
  
  describe '商品出品機能' do

    context '商品が出品できるとき' do
      it 'image、products_name、explanation、genre_id、contition_id、shipping_cost、price、shipping_dayが存在すれば出品できる' do
       expect(@product).to be_valid
      end
    end

    context '商品が出品できないとき' do

      it 'userが紐づいていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end

      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'product_nameが空だと出品できない' do
        @product.product_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it 'explanationが空だと出品できない' do
        @product.explanation = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'genre_idが1だと出品できない' do
        @product.genre_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Genre must be other than 1")
      end

      it 'condition_idが1だと出品できない' do
        @product.condition_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'shipping_cost_idが1だと出品できない' do
        @product.shipping_cost_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost must be other than 1")
      end

      it 'prefecture_idが1だと出品できない' do
        @product.prefecture_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'shipping_day_idが1だと出品できない' do
        @product.shipping_day_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it 'priceが空だと出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角整数以外だと出品できない' do
        @product.price =  "１２３４５" #
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが300未満だと出品できない' do
        @product.price = "110"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be between 300 and 9999999")
      end

      it 'priceが9999999より大きいと出品できない' do
        @product.price = "100000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be between 300 and 9999999")
      end

    end

  end
end
