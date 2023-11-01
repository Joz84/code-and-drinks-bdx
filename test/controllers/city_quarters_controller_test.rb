require "test_helper"

class CityQuartersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get city_quarters_show_url
    assert_response :success
  end
end
