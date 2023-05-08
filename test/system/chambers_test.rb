require "application_system_test_case"

class ChambersTest < ApplicationSystemTestCase
  setup do
    @chamber = chambers(:one)
  end

  test "visiting the index" do
    visit chambers_url
    assert_selector "h1", text: "Chambers"
  end

  test "should create chamber" do
    visit chambers_url
    click_on "New chamber"

    fill_in "Description", with: @chamber.description
    fill_in "Name", with: @chamber.name
    fill_in "Notes", with: @chamber.notes
    click_on "Create Chamber"

    assert_text "Chamber was successfully created"
    click_on "Back"
  end

  test "should update Chamber" do
    visit chamber_url(@chamber)
    click_on "Edit this chamber", match: :first

    fill_in "Description", with: @chamber.description
    fill_in "Name", with: @chamber.name
    fill_in "Notes", with: @chamber.notes
    click_on "Update Chamber"

    assert_text "Chamber was successfully updated"
    click_on "Back"
  end

  test "should destroy Chamber" do
    visit chamber_url(@chamber)
    click_on "Destroy this chamber", match: :first

    assert_text "Chamber was successfully destroyed"
  end
end
