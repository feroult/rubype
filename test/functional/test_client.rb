require 'helper'

class TestClient < Test::Unit::TestCase

  def test_client_creation
    client = Buscape::Client.new(:application_id => @application_id)  
    assert_equal client.application_id, @application_id
  end

  def test_base_api_call
    client = Buscape::Client.new(:application_id => @application_id)  
    client.raw_api 'findCategoryList', :keyword => 'LG'
  end
  
end
