class WomenController < ApplicationController
  before_action :set_woman, only: [:show, :edit, :update, :destroy]
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

  def update
    @woman = Woman.find(params[:id])
    if @woman.update(woman_params)
      redirect_to @woman, notice: 'Woman item updated!'
    else
      render action: 'edit'
    end
  end

  def show
  end

  def destroy
  end


  private
  
    def set_woman
      @woman = Woman.find(params[:id])
    end


    def woman_params
      params.require(:woman).permit(:title, :description, :image_url, :price)
    end
end
