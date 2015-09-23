require "rails_helper"

RSpec.feature "Yelp Search", type: :feature do
  scenario "User enters a valid address on landing page" do
    visit root_path

    fill_in "address", with: "800 Decatur St, New Orleans, LA 70116"
    click_button "Walk"

    expect(page).to have_content("Cafe Du Monde")
    expect(page).to have_content("800 Decatur St")
    expect(page).to have_content("French Quarter")
    expect(page).to have_content("0.00 mi")
  end

  scenario "User visits search page without entering a location" do
    visit search_path

    # Expect location to default to Turing School
    expect(page).to have_content("Little Owl Coffee")
    expect(page).to have_content("1555 Blake St")
    expect(page).to have_content("Northwest")
    expect(page).to have_content("Lodo")
    expect(page).to have_content("0.04 mi")
  end

  scenario "User enters an invalid address on landing page" do
    visit root_path

    fill_in "address", with: "blah"
    click_button "Walk"

    # Expect Yelp to return best guess
    expect(page).to have_content("Gaststätte Sportheim Obernheim")
    expect(page).to have_content("Auf der Blah 3")
  end
end
