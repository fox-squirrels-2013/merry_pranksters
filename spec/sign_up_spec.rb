require 'spec_helper'

feature "Create a new account" do

  scenario "Visitor creates a new account" do
    visit '/sign_up'
    fill_in "username", with: "something"
    fill_in "password", with: "password"
    click_on "Save"

    expect(page).to have_content("You have successfully created an account")
  end

  scenario "Visitor does not provide a username and/or password" do
    visit '/sign_up'
    fill_in "username", with: "something"
    click_on "Save"

    expect(page).to have_content("Please provide a username or password")
  end

end