require "test_helper"

class DailyStatementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_statement = daily_statements(:one)
  end

  test "should get index" do
    get daily_statements_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_statement_url
    assert_response :success
  end

  test "should create daily_statement" do
    assert_difference("DailyStatement.count") do
      post daily_statements_url, params: { daily_statement: { age_days: @daily_statement.age_days, age_weeks: @daily_statement.age_weeks, chamber_id: @daily_statement.chamber_id, consumed_food: @daily_statement.consumed_food, consumed_water: @daily_statement.consumed_water, daily_production: @daily_statement.daily_production, deceased: @daily_statement.deceased, highest_temp: @daily_statement.highest_temp, humidity_ratio: @daily_statement.humidity_ratio, lowest_temp: @daily_statement.lowest_temp, production_ratio: @daily_statement.production_ratio, remaining: @daily_statement.remaining, total_count: @daily_statement.total_count } }
    end

    assert_redirected_to daily_statement_url(DailyStatement.last)
  end

  test "should show daily_statement" do
    get daily_statement_url(@daily_statement)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_statement_url(@daily_statement)
    assert_response :success
  end

  test "should update daily_statement" do
    patch daily_statement_url(@daily_statement), params: { daily_statement: { age_days: @daily_statement.age_days, age_weeks: @daily_statement.age_weeks, chamber_id: @daily_statement.chamber_id, consumed_food: @daily_statement.consumed_food, consumed_water: @daily_statement.consumed_water, daily_production: @daily_statement.daily_production, deceased: @daily_statement.deceased, highest_temp: @daily_statement.highest_temp, humidity_ratio: @daily_statement.humidity_ratio, lowest_temp: @daily_statement.lowest_temp, production_ratio: @daily_statement.production_ratio, remaining: @daily_statement.remaining, total_count: @daily_statement.total_count } }
    assert_redirected_to daily_statement_url(@daily_statement)
  end

  test "should destroy daily_statement" do
    assert_difference("DailyStatement.count", -1) do
      delete daily_statement_url(@daily_statement)
    end

    assert_redirected_to daily_statements_url
  end
end
