class VotesController < ApplicationController
  def create
    track = Track.find(params[:track_id])
    vote = track.votes.build(params[:vote])
    vote_saved = vote.save
    if vote_saved
      track.vote_count += 1
    end
    success = vote_saved and track.save
    user = User.find_by_id(track.user_id)
    redirect_to user
  end
end
