class WomenController < ApplicationController
  def index
    @women = Woman.all
  end

  def edit
  end

  def new
    @woman = Woman.new
  end

  def create
    @woman = Woman.new(woman_params)
    if @woman.save
      redirect_to @woman, notice: 'Product Added!'
    else
      render action: 'new'
    end
  end

  def show
  end

  private

  def woman_params
      params.require(:woman).permit(:title, :description, :image_url, :price)
    end
end
