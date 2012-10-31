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

  scope :in_genres, lambda {|*genres|
    joins('inner join artists_genres ag on artists.id = ag.artist_id').
    joins('inner join genres g on g.id = ag.genre_id')
    .where('g.name in (?)', genres.flatten)
    .uniq
  }

  scope :in_state, lambda {|state|
    joins(:zipcode).where('zipcodes.state = ?', state)
  }

  scope :on_date, lambda {|this_date|
    this_date = this_date.is_a?(String) ? Date.parse(this_date) : this_date
    joins('left outer join blackout_dates bd on artists.id = bd.artist_id')
    .where('? NOT IN (SELECT bdate FROM blackout_dates WHERE artist_id = artists.id)', this_date)
    .on_day(this_date)
    .uniq
  }

  scope :on_day, lambda {|this_date|
    where("available_#{this_date.strftime('%A').downcase}".to_sym => true)
  }

  def home_city
    if zipcode.present?
      "#{zipcode.primary_city}, #{zipcode.state}"
    end
  end

  def genre_list
    genres.map(&:name).join(", ")
  end

  def zip_name
    zipcode.try(:zipcode)
  end

  def zip_name=(name)
    self.zipcode = Zipcode.find_by_zipcode(name) if name.present?
  end
end
