class Artist < ActiveRecord::Base
  attr_accessible :available_friday, :available_monday, :available_saturday, :available_sunday,
    :available_thursday, :available_tuesday, :available_wednesday, :covers_percentage,
    :description, :image, :name, :phone, :user_id, :website, :zipcode_id
end
