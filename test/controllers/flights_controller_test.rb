require "test_helper"

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get flights_resources_url
    assert_response :success
  end
end
