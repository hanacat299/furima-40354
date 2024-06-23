class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]

  def index
    @product = Product.find(params[:product_id])
    if @product.user == current_user || @product.order.present?
      redirect_to root_path
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params.merge(product_id: params[:product_id], user_id: current_user.id))
    if @orderform.valid?
      pay_product
      @orderform.save
      return redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render "index", status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number
      ).merge(token: params[:token])
  end


  def pay_product
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
