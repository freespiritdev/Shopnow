class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

   def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart, notice: 'Cart was created'
    else
      render action: 'new'
    end
  end

   def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart successfully updated.'
    else
      render action: 'edit'
    end
  end
  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

  def cart_params
      params[:cart]
    end
end
