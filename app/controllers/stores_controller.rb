class StoresController < ApplicationController
  def index
    @products = Product.order(:title)
  end
end
