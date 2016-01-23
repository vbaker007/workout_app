require "rails_helper"

RSpec.feature "Searching for User" do 
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com",
      password: "password")
    @fred = User.create(first_name: "Fred", last_name: "Taylor", email: "fredtaylor@example.com",
      password: "password")
  end

  scenario "with existing name returns all those users"
    visit "/"

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@john.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end