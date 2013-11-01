require 'spec_helper'

feature "Listing posts" do

  scenario "User can see the list of posts" do
    visit '/sign_up'
    fill_in "username", with: "bibble"
    fill_in "password", with: "password"
    click_on 'Save'
    visit '/'

    expect(page).to have_content("Post something:")
  end

  scenario "User can create a post" do
    visit '/sign_up'
    fill_in "username", with: "bibble"
    fill_in "password", with: "password"
    click_on 'Save'
    visit '/'
    fill_in "title", with: "New Post"
    fill_in "content", with: "New content"
    click_on 'Post it!'

    expect(page).to have_content("New content")
  end

  scenario "Visitor cannot see posts" do
    visit '/sign_up'
    fill_in "username", with: "bibble"
    fill_in "password", with: "password"
    click_on 'Save'
    visit '/'
    click_on 'Sign Out'

    expect(page).to_not have_content("Post something:")
  end

end