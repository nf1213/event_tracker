require 'rails_helper'

feature "User creates a new Event" do
  # As a User
  # I want to create a new Event
  # So that other users can find the Event
  #
  # Acceptance Criteria:
  #
  # * I must provide a location

  it "creates a valid event" do
    # Visit the page containing the new event form
    visit '/events/new'

    # Fill in the input field with the 'Location' label
    fill_in "Location", with: "Launch Academy"
    click_on "Create Event"

    expect(page).to have_content "Event was successfully created"
  end

  it "requires a location" do
    visit '/events/new'

    # Notice that we have omitted the step where we fill out the location field
    click_on "Create Event"

    expect(page).to have_content "can't be blank"
  end
end

describe "Creating Events" do
  it "displays the location text after creation" do
    visit "/events"
    click_link "New Event"
    txt = "My Place"
    fill_in "event[location]", :with => txt
    click_button "Create Event"
    expect(Event.all.count).to eq(1)
    expect(Event.last.location).to eq(txt)
    #save_and_open_page
  end
end
