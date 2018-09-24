class Api::LineItemsController < ApplicationController
  def index
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:order_id])

    render json: order.line_items
  end

  def create
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:order_id])
    
    price = Product.find(params[:product_id]).price
    # Add quantity to existing quantity when line item already exists
    order.line_items.each do |item|
      if params[:product_id] == item.product_id
        new_quantity = item.quantity + params[:quantity]
        item.update(quantity: new_quantity, price: new_quantity*price)
        render json: item and return
      end
    end

    # When the line item doesn't already exist, create a new one using params
    line_item = order.line_items.create(line_item_params)
    line_item.update(price: line_item.quantity*price)
    if line_item.save()
      render json: line_item
    else
      render json: {error:"An error occured"}
    end
  end

  def show
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:order_id])
    line_item = order.line_items.find(params[:id])

    render json: line_item
  end

  def update
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:order_id])
    line_item = order.line_items.find(params[:id])

    if line_item.update_attributes(line_item_params)
      price = Product.find(params[:product_id]).price
      line_item.update(price: line_item.quantity*price)
      render json: line_item
    else
      render json: {error: 'An error occured'}
    end
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    order = shop.orders.find(params[:order_id])
    line_item = order.line_items.find(params[:id])

    if line_item.destroy
      render json: line_item
    else
      render json: {error: 'An error occured'}
    end
  end


  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :order_id, :product_id, :price)
  end
end
