class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product Added!'
    else
      render action: 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Product successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
    title = @product.title

    if @product.destroy
      flash[:notice] = "\"#{title}\" was deleted!"
      redirect_to @product
    else
      flash[:error] = "There was an error!"
      render :show
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end