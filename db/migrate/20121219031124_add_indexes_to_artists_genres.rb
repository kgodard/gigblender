class AddIndexesToArtistsGenres < ActiveRecord::Migration
  def change
    add_index :artists_genres, :artist_id
    add_index :artists_genres, :genre_id
  end
end
