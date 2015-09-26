class StoresController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.order(:title)
    @women = Woman.order(:title)
  end
end
