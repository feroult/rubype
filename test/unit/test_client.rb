require 'helper'

class TestClient < Test::Unit::TestCase

  def setup
    @api_key = 'apikey'
  end

  def test_client_creation
    buscape = Buscape::Client.new(:api_key => @api_key) 
    assert buscape.api_key == @api_key
  end
  
end
