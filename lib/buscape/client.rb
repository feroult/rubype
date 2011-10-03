module Buscape
  class Client  
    include Support::RestHelper
  
    attr_reader :application_id, :sandbox, :country
    
    def initialize(options = {})
      @application_id = options[:application_id]
      @sandbox = options[:sandbox]
      @country = options[:country] ? options[:country] : 'br'
    end    
    
    def raw_api(service_name, params = {})
      params.merge!(:format => 'json')
      get endpoint(service_name), params      
    end
        
    private 
      def endpoint(service_name)  
        if @sandbox
          "http://sandbox.buscape.com/service/#{service_name}/#{@application_id}/#{@country}/"
        else
          "http://bws.buscape.com/#{service_name}/#{@application_id}/#{@country}/"        
        end
      end    
  end
end
