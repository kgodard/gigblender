class BlackoutDate < ActiveRecord::Base
  attr_accessible :artist_id, :bdate
  belongs_to :artist
end
