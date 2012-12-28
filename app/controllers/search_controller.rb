require 'open-uri'
require 'json'

class SearchController < ApplicationController
  def track
    unless params[:q].nil?
      res = JSON.parse open( URI.encode("http://ws.spotify.com/search/1/track.json?q=#{params[:q]}") ).read
      results = res['tracks'][0..5].collect { |a| a['name'] }
      @json = JSON.generate results
    end
    render 'search/results.json'
  end

  def artist
    unless params[:q].nil?
      res = JSON.parse open( URI.encode("http://ws.spotify.com/search/1/artist.json?q=#{params[:q]}") ).read
      results = res['artists'][0..5].collect { |a| a['name'] }
      @json = JSON.generate results
    end
    render 'search/results.json'
  end
end
