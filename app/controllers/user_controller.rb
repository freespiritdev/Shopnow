class UserController < ApplicationController
  def index
    @users = User.order(:name)
  end

  def new
    @user = User.new
  end
end
