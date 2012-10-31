class Genre < ActiveRecord::Base
  attr_accessible :name

  default_scope order('name')

  has_and_belongs_to_many :artists
  # has_and_belongs_to_many :slots

  def self.all_genre_names
    all.map(&:name)
  end

  def self.seed_data!
    self.delete_all

    I18n.translate("faker.genre.name").each { |g| Genre.create(:name => g) }
  end
end

