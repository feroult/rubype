require 'helper'

class TestClient < Test::Unit::TestCase

  def test_client_creation
    client = Buscape::Client.new(:application_id => @application_id)  
    assert_equal client.application_id, @application_id
    assert_equal client.env, 'bws'
    assert_equal client.country, 'br'
  end

  def test_client_creation_sandbox
    client = Buscape::Client.new(:application_id => @application_id, :sandbox => true)  
    assert client.sandbox
  end

  def text_client_creation_mexico
    client = Buscape::Client.new(:application_id => @application_id, :country => 'mx')  
    assert_equal client.country, 'mx'    
  end

  def test_raw_api_call
    client = Buscape::Client.new(:application_id => @application_id)  
    response = client.raw_api 'findCategoryList', :keyword => 'LG'
    debugger    
    assert_equal response.detail.status, 'success' #fixme API
  end

  
end
