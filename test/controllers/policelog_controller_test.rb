require 'test_helper'

class PolicelogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get policelog_index_url
    assert_response :success
  end

end
