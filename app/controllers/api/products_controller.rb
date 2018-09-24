class Api::ProductsController < ApplicationController
  def index
    shop = Shop.find(params[:shop_id])
    product = shop.products
    render json: product
  end

  def create
    shop = Shop.find(params[:shop_id])
    product = shop.products.create(product_params)

    if product.save
      render json: product
    else
      render json: {error:'An error occured'}
    end
  end

  def show
    shop = Shop.find(params[:shop_id])
    product = shop.products.find(params[:id])
    render json: product
  end


  def update
    shop = Shop.find(params[:shop_id])
    product = Product.find(params[:id])
    if product.update_attributes(product_params)
      render json: product
    else
      render json: {error: 'An error occured'}
    end
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    product = shop.products.find(params[:id])
    if product.destroy
      render json: product
    else
      render json: {error: 'An error occured'}
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
