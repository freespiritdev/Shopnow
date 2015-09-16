class WomenController < ApplicationController
  def index
    @women = Woman.all
  end

  def edit
  end

  def new
    @woman = Woman.new
  end

  def show
  end
end
