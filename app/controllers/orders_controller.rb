class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    if @cart.line_items.empty?
      redirect_to @store, notice: "Your cart is empty"
      return
    end
  
    @order = Order.new
  end



  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to @order, notice: 'Thank you for your order'
      else
        render action: 'new'
      end
    end
    
end
