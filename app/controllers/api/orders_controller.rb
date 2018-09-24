class Api::OrdersController < ApplicationController
  def index
    shop = Shop.find(params[:shop_id])
    order = shop.orders
    render json: order
  end

  def create
    shop = Shop.find(params[:shop_id])
    order = shop.orders.create()

    if order.save
      render json: order
    else
      render json: {error:'An error occured'}
    end
  end

  def show
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:id])
    bill = 0
    # Sum prices of line items in order
    order.line_items.each do |item|
      bill+= item.price
    end

    render json: {id: params[:id], order:order.line_items, bill:bill}
  end


  def update
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:id])
    if order.update_attributes(order_params)
      render json: order
    else
      render json: {error: 'An error occured'}
    end
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:id])
    if order.destroy
      render json: order
    else
      render json: {error: 'An error occured'}
    end
  end

  private

  def order_params
    params.permit(:order)
  end
end
