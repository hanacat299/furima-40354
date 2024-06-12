class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    if user_signed_in?
     if @product.user == current_user
      render "edit"
     else
      redirect_to root_path
     end
    else
     redirect_to new_user_session_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def product_params
    params.require(:product).permit(
      :product_name, :explanation, :price, :genre_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image
      )
      .merge(user_id: current_user.id)
  end

end
