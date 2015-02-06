class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  def index
    @line_items = LineItem.all
  end

  def new
    @line_item = LineItem.new
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id) 

    if @line_item.save
      redirect_to @line_item.cart, notice: 'Line item was created.'

    else
      render action: 'new'
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render action: 'edit'
    end
  end
end
