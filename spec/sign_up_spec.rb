require 'spec_helper'

feature "Create a new account" do

  scenario "Visitor creates a new account" do
    visit '/sign_up'
    fill_in "username", with: "something"
    fill_in "password", with: "password"
    fill_in "email", with: "email@email.com"
    click_on "Save"

    expect(page).to have_content("list of merry pranksters")
  end

  scenario "Visitor does not provide a username and/or password" do
    visit '/sign_up'
    fill_in "username", with: "something"
    click_on "Save"

    expect(page).to have_content("Please provide a valid username and/or password")
  end

end