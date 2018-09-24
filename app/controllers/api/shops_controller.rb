class Api::ShopsController < ApplicationController
  def index
    shop = Shop.all
    render json: shop
  end

  def create
    shop = Shop.new(shop_params)
    if shop.save
      render json: shop
    else
      render json: {error:'An error occured'}
    end
  end

  def show
    shop = Shop.find(params[:id])
    render json: shop
  end


  def update
    shop = Shop.find(params[:id])
    if shop.update_attributes(shop_params)
      render json: shop
    else
      render json: {error: 'An error occured'}
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    if shop.destroy
      render json: shop
    else
      render json: {error: 'An error occured'}
    end
  end

  private

  def shop_params
    params.permit(:name)
  end
end
