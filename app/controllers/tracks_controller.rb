class TracksController < ApplicationController
  def create
    #render :text => params
    #puts "logged in" + user_signed_in?.to_s
    #puts "name " + current_user.name if user_signed_in?
    @user = User.find(params[:user_id])
    @track = @user.tracks.build(params[:track])

    if @track.save
      flash[:success] = 'Track added'
      redirect_to @user
    else
      flash[:error] = 'Track not saved'
      redirect_to @user
    end
  end
end
