class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @orderform = OrderForm.new
  end

  def create
  end
end
