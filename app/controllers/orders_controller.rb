class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:purchase]

  def index
    @product = Product.find(params[:product_id])
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params.merge(product_id: params[:product_id], user_id: current_user.id))
    if @orderform.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render "index", status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number
      )
  end

  def purchase
    @product = Product.find(params[:id])

    # 自身が出品した商品の場合はトップページにリダイレクト
    if @product.user == current_user
      redirect_to root_path, alert: "自分が出品した商品の購入ページにはアクセスできません。"
    end
  end

end
