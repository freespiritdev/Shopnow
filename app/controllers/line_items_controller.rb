class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]


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
      redirect_to @store
      format.js {@current_item = @line_item}

    else
      render action: 'new'
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated!'
    else
      render action: 'edit'
    end
  end

  private

   def set_line_item
      @line_item = LineItem.find(params[:id])
    end

  def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
