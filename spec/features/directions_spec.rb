require "rails_helper"

RSpec.feature "Directions", type: :feature do
  scenario "User clicks on directions button for a search result" do
    visit search_path

    row = find("tr", text: "Little Owl Coffee")
    within(row) { click_button "Directions" }

    expect(page).to have_content("Walk to Little Owl Coffee")
  end
end
