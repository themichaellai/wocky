class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @track = @user.tracks.build
    @vote = @track.votes.build
    @tracks = @user.tracks.all
    render 'public/404.html' if @user.nil?
  end
end
