require 'spec_helper'
include Warden::Test::Helpers
 
module RequestHelpers

  def generate_artists
    FactoryGirl.create_list(:artist, 25)
  end

  def create_logged_in_user
    user = FactoryGirl.create(:user)
    user.confirm!
    login(user)
    user
  end
 
  def login(user)
    login_as user, scope: :user
  end
end
