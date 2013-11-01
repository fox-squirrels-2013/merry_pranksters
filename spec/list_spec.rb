require 'spec_helper'

feature "Listing members" do

  scenario "User can see the list of members" do
    visit '/sign_up'
    fill_in "username", with: "bibble"
    fill_in "password", with: "password"
    fill_in "email", with: "email@email.com"
    click_on 'Save'
    visit '/list'

    expect(page).to have_content("list of merry pranksters")
  end

  scenario "Visitor cannot see the list of members" do
    visit '/'
    # click_on 'Log Out' # if test is logged in -- does this even matter?
    visit '/list'

    expect(page).to have_content("You need to be logged in to see this page.")
  end

end