class OrdersController < ApplicationController
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
      render "index"
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number
      )
  end
end
