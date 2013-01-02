class Vote < ActiveRecord::Base
  attr_accessible :ip
  belongs_to :track

  validates :ip, presence: true
  validates :track_id, presence: true

  validates_uniqueness_of :ip, :scope => :track_id
end
