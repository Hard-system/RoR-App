require 'test_helper'

class CruisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cruise = cruises(:one)
  end

  test "should get index" do
    get cruises_url
    assert_response :success
  end

  test "should get new" do
    get new_cruise_url
    assert_response :success
  end

  test "should create cruise" do
    assert_difference('Cruise.count') do
      post cruises_url, params: { cruise: { name: @cruise.name, ship_id: @cruise.ship_id } }
    end

    assert_redirected_to cruise_url(Cruise.last)
  end

  test "should show cruise" do
    get cruise_url(@cruise)
    assert_response :success
  end

  test "should get edit" do
    get edit_cruise_url(@cruise)
    assert_response :success
  end

  test "should update cruise" do
    patch cruise_url(@cruise), params: { cruise: { name: @cruise.name, ship_id: @cruise.ship_id } }
    assert_redirected_to cruise_url(@cruise)
  end

  test "should destroy cruise" do
    assert_difference('Cruise.count', -1) do
      delete cruise_url(@cruise)
    end

    assert_redirected_to cruises_url
  end
end
