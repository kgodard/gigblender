require 'csv'
class Zipcode < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :primary_city, :state, :timezone, :zipcode

  has_many :artists

  def display_name
    "#{primary_city}, #{state}, #{zipcode}"
  end

  def self.seed_data!
    valid_keys = [:latitude, :longitude, :primary_city, :state, :timezone, :zipcode]
    self.delete_all

    zip_codes = []
    record_count = 0
    CSV.foreach("#{Rails.root}/db/seed_data/zip_code_database.csv", :headers => true) do |csv|
      zip_codes.push "(#{insert_line(csv)})"
      record_count += 1
      if(record_count > 10_000)
        execute_sql(zip_codes)
        zip_codes = []
        record_count = 0
      end
    end
    execute_sql(zip_codes)

  end

private
  def self.insert_line(csv)
    string = [csv['zip'], csv['latitude'], csv['longitude'], csv['primary_city'], csv['state'], csv['timezone']].join("', '")
    string.gsub!(/^/, "'").gsub!(/$/, "'")
    string
  end

  def self.execute_sql(zip_codes)
    sql = "INSERT INTO zipcodes (`zipcode`, `latitude`, `longitude`, `primary_city`, `state`, `timezone`) VALUES #{zip_codes.join(", ")}"
    Zipcode.connection.execute(sql)
  end
end
