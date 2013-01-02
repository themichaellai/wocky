class Track < ActiveRecord::Base
  attr_accessible :artist, :name, :spotify_uri, :user_id, :vote_count
  belongs_to :user
  has_many :votes

  validates :user_id, presence: true
  validates_uniqueness_of :spotify_uri, :scope => :user_id
end
