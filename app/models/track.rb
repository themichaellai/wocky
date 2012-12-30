class Track < ActiveRecord::Base
  attr_accessible :artist, :name, :spotify_uri, :user_id
  belongs_to :user

  validates :user_id, presence: true
  validates_uniqueness_of :spotify_uri, :scope => :user_id
end
