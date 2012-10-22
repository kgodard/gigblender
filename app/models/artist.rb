class Artist < ActiveRecord::Base
  attr_accessible :available_friday, :available_monday, :available_saturday, :available_sunday,
    :available_thursday, :available_tuesday, :available_wednesday, :covers_percentage,
    :description, :image, :name, :phone, :user_id, :website, :zipcode_id, :genre_ids

  validates :name, :presence => true

  belongs_to :user

  has_and_belongs_to_many :genres

  mount_uploader :image, ImageUploader
end
