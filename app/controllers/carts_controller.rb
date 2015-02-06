class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

   def create
    @product = Cart.new(carts_params)
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
end
