class ProductsController < ApplicationController

  private

  def product_params
    params.rwquire(:products).permit(:image).merge(user_id: current_user.id)
  end
end
