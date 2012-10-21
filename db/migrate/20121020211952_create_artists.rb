class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :website
      t.string :phone
      t.string :covers_percentage
      t.text :description
      t.boolean :available_sunday
      t.boolean :available_monday
      t.boolean :available_tuesday
      t.boolean :available_wednesday
      t.boolean :available_thursday
      t.boolean :available_friday
      t.boolean :available_saturday
      t.integer :user_id
      t.integer :zipcode_id
      t.string :image

      t.timestamps
    end
  end
end
