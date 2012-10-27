# require 'spec_helper'
include RequestHelpers

describe "Artists", :focus do
  let!(:artists) { generate_artists }

  describe "GET /artists" do
    it "is possible to list artists without being logged in" do
      visit root_path
      click_link 'Artists'
      artists.each do |artist|
        page.has_link?(artist.name).should be_true
      end
    end
  end

  describe "signed_in user" do

    describe "artists index page" do

      before :each do
        @user = create_logged_in_user
        @first_artist = artists.first
        @artist = FactoryGirl.create(:artist, :name => 'Awesome', :user => @user)
      end

      context "/artists" do
        it "displays a list of artists" do
          visit artists_path
          artists.each do |artist|
            page.has_link?(artist.name).should be_true
          end
        end

        it "contains edit links for artists belonging to user" do
          visit artists_path
          all('a').map {|a| a[:href] }.should include edit_user_artist_path(@user, @artist)
        end

        it "does not contain edit links for artists NOT belonging to user" do
          visit artists_path
          all('a').map {|a| a[:href] }.should_not include edit_user_artist_path(@user, @first_artist)
        end
      end
    end
  end
end
