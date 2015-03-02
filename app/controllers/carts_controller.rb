class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart, notice: 'Cart was created!'
    else
      render action: 'new'
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart successfully updated!'
    else
      render action: 'edit'
    end
  end

   def destroy
    @cart.destroy 
    if @cart.id == session[:cart_id]
      session[:cart_id] = nil
    redirect_to stores_url
    end
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

  def cart_params
    params[:cart]
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to stores_url, notice: 'Invalid cart!'
  end
end
