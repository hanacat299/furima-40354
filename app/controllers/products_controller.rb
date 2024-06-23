class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
 

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
  end

  def edit

     if @product.order.present?
      redirect_to root_path
     elsif @product.user == current_user 
      render "edit"
     else
      redirect_to root_path
     end
    
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.user == current_user
      @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def product_params
    params.require(:product).permit(
      :product_name, :explanation, :price, :genre_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image
      )
      .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
