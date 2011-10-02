module Buscape
  class Client  
    include Support::RestHelper
  
    attr_reader :application_id, :env, :country
    
    def initialize(options = {})
      @application_id = options[:application_id]
      @env = options[:sandbox] ? 'sandbox' : 'bws'            
      @country = options[:country] ? options[:country] : 'br'
    end    
    
    def raw_api(service_name, params = {})
      params.merge!(:format => 'json')
      get endpoint(service_name), params      
    end
        
    private 
      def endpoint(service_name)
        "http://#{@env}.buscape.com/service/#{service_name}/#{@application_id}/#{@country}/"
      end    
  end
end
