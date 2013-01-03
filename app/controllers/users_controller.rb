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

  def playlist
    user = User.find_by_id(params[:user_id])
    min_count = if params[:min_count].nil? then 3 else params[:min_count] end
    tracks = user.tracks.all(:conditions => ["vote_count >= ?", min_count])
    render :json => tracks.map{ |track| track.as_json(:only => [:artist, :name, :spotify_uri]) }
  end
end
