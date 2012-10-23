class Artist < ActiveRecord::Base
  attr_accessible :available_friday, :available_monday, :available_saturday, :available_sunday,
    :available_thursday, :available_tuesday, :available_wednesday, :covers_percentage, :zip_name,
    :description, :image, :name, :phone, :user_id, :website, :zipcode_id, :genre_ids, :blackout_dates_attributes

  validates :name, :presence => true

  belongs_to :user
  belongs_to :zipcode

  has_and_belongs_to_many :genres

  has_many :blackout_dates, :dependent => :destroy
  accepts_nested_attributes_for :blackout_dates, :allow_destroy => true

  mount_uploader :image, ImageUploader

  def zip_name
    zipcode.try(:zipcode)
  end

  def zip_name=(name)
    self.zipcode = Zipcode.find_by_zipcode(name) if name.present?
  end
end
