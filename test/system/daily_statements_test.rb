require "application_system_test_case"

class DailyStatementsTest < ApplicationSystemTestCase
  setup do
    @daily_statement = daily_statements(:one)
  end

  test "visiting the index" do
    visit daily_statements_url
    assert_selector "h1", text: "Daily statements"
  end

  test "should create daily statement" do
    visit daily_statements_url
    click_on "New daily statement"

    fill_in "Age days", with: @daily_statement.age_days
    fill_in "Age weeks", with: @daily_statement.age_weeks
    fill_in "Chamber", with: @daily_statement.chamber_id
    fill_in "Consumed food", with: @daily_statement.consumed_food
    fill_in "Consumed water", with: @daily_statement.consumed_water
    fill_in "Daily production", with: @daily_statement.daily_production
    fill_in "Deceased", with: @daily_statement.deceased
    fill_in "Highest temp", with: @daily_statement.highest_temp
    fill_in "Humidity ratio", with: @daily_statement.humidity_ratio
    fill_in "Lowest temp", with: @daily_statement.lowest_temp
    fill_in "Production ratio", with: @daily_statement.production_ratio
    fill_in "Remaining", with: @daily_statement.remaining
    fill_in "Total count", with: @daily_statement.total_count
    click_on "Create Daily statement"

    assert_text "Daily statement was successfully created"
    click_on "Back"
  end

  test "should update Daily statement" do
    visit daily_statement_url(@daily_statement)
    click_on "Edit this daily statement", match: :first

    fill_in "Age days", with: @daily_statement.age_days
    fill_in "Age weeks", with: @daily_statement.age_weeks
    fill_in "Chamber", with: @daily_statement.chamber_id
    fill_in "Consumed food", with: @daily_statement.consumed_food
    fill_in "Consumed water", with: @daily_statement.consumed_water
    fill_in "Daily production", with: @daily_statement.daily_production
    fill_in "Deceased", with: @daily_statement.deceased
    fill_in "Highest temp", with: @daily_statement.highest_temp
    fill_in "Humidity ratio", with: @daily_statement.humidity_ratio
    fill_in "Lowest temp", with: @daily_statement.lowest_temp
    fill_in "Production ratio", with: @daily_statement.production_ratio
    fill_in "Remaining", with: @daily_statement.remaining
    fill_in "Total count", with: @daily_statement.total_count
    click_on "Update Daily statement"

    assert_text "Daily statement was successfully updated"
    click_on "Back"
  end

  test "should destroy Daily statement" do
    visit daily_statement_url(@daily_statement)
    click_on "Destroy this daily statement", match: :first

    assert_text "Daily statement was successfully destroyed"
  end
end
