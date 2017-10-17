require 'test_helper'

class TravelagentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get travelagent_index_url
    assert_response :success
  end

end
