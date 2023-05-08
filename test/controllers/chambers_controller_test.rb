require "test_helper"

class ChambersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chamber = chambers(:one)
  end

  test "should get index" do
    get chambers_url
    assert_response :success
  end

  test "should get new" do
    get new_chamber_url
    assert_response :success
  end

  test "should create chamber" do
    assert_difference("Chamber.count") do
      post chambers_url, params: { chamber: { description: @chamber.description, name: @chamber.name, notes: @chamber.notes } }
    end

    assert_redirected_to chamber_url(Chamber.last)
  end

  test "should show chamber" do
    get chamber_url(@chamber)
    assert_response :success
  end

  test "should get edit" do
    get edit_chamber_url(@chamber)
    assert_response :success
  end

  test "should update chamber" do
    patch chamber_url(@chamber), params: { chamber: { description: @chamber.description, name: @chamber.name, notes: @chamber.notes } }
    assert_redirected_to chamber_url(@chamber)
  end

  test "should destroy chamber" do
    assert_difference("Chamber.count", -1) do
      delete chamber_url(@chamber)
    end

    assert_redirected_to chambers_url
  end
end
