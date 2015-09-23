require "rails_helper"

RSpec.feature "Search", type: :feature do
  scenario "User enters a valid address on landing page" do
    visit root_path

    fill_in "address", with: "800 Decatur St, New Orleans, LA 70116"
    click_button "Walk"

    expect(page).to have_content("Jackson Square")
    expect(page).to have_content("506 C St. Peter St")
    expect(page).to have_content("French Quarter")
    expect(page).to have_content("0.06 mi")
    expect(page).to have_content("98")
    expect(page).to have_content("Walker's Paradise")
  end

  scenario "User visits search page without entering a location" do
    visit search_path

    # Expect location to default to Turing School
    expect(page).to have_content("Little Owl Coffee")
    expect(page).to have_content("1555 Blake St")
    expect(page).to have_content("Northwest")
    expect(page).to have_content("Lodo")
    expect(page).to have_content("0.04 mi")
    expect(page).to have_content("92")
    expect(page).to have_content("Walker's Paradise")
  end

  scenario "User enters an invalid address on landing page" do
    visit root_path

    fill_in "address", with: "Cafe Du Monde"
    click_button "Walk"

    # Expect location to default to Turing School
    expect(page).to have_content("Little Owl Coffee")
    expect(page).to have_content("1555 Blake St")
    expect(page).to have_content("Northwest")
    expect(page).to have_content("Lodo")
    expect(page).to have_content("0.04 mi")
    expect(page).to have_content("92")
    expect(page).to have_content("Walker's Paradise")
  end
end
