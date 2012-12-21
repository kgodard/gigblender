class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :website
      t.string :phone
      t.string :covers_percentage
      t.text :description
      t.boolean :available_sunday, :default => true
      t.boolean :available_monday, :default => true
      t.boolean :available_tuesday, :default => true
      t.boolean :available_wednesday, :default => true
      t.boolean :available_thursday, :default => true
      t.boolean :available_friday, :default => true
      t.boolean :available_saturday, :default => true
      t.integer :user_id
      t.integer :zipcode_id
      t.string :image

      t.timestamps
    end
  end
end
