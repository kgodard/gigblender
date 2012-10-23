class CreateBlackoutDates < ActiveRecord::Migration
  def change
    create_table :blackout_dates do |t|
      t.date :bdate
      t.integer :artist_id

      t.timestamps
    end
  end
end
