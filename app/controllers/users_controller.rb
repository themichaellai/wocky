class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_id(params[:id])
    render 'public/404.html' if @user.nil?
  end
end
