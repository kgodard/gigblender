# require 'spec_helper'
include RequestHelpers

describe "Registrations" do

  describe "registration" do
    it "a new user can register" do
      visit new_user_registration_path
      fill_in 'Email', :with => 'foobar@baz.com'
      fill_in 'Password', :with => 'testpass'
      fill_in 'Password confirmation', :with => 'testpass'
      click_button 'Sign up'
      page.has_content?('Welcome!').should be_true
      page.has_no_button?('Sign up').should be_true
    end
  end

  describe "signed_in user" do
    let!(:authed_user) { create_logged_in_user }

    it "allows access" do
      visit edit_user_registration_path(authed_user)
    end
  end
end
