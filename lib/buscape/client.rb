module Buscape
  class Client
    attr_reader :application_id
    
    def initialize(options = {})
      @application_id = options[:application_id]
    end    
    
    def raw_api(service_name, params = {})
      
    end
  end
end
