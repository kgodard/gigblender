class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :zipcode
      t.string :primary_city
      t.string :state
      t.string :timezone
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
