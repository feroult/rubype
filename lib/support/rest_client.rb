module Support
  module RestClient

    attr_accessor :endpoint

    def initialize(endpoint = WhoShares.endpoint)
      self.endpoint = endpoint
    end
    
    def parse(text)
      JSON.parse(text, :symbolize_names => true, :object_class => JSONHash)
    end
    
    def split_params(params)    
      params.inject(Hash.new) do |new_params, (k,v)|        
        if v.kind_of? Hash
          v.each { |(k2, v2)| new_params["#{k}[#{k2}]"] = v2 }
        else
          new_params[k] = v
        end      
        new_params
      end                
    end
    
    def get(url, params = {})
      #p "#{domain}/#{url}"
      RestClient.get("#{endpoint}/#{url}", :params => split_params(params)) do |response, request, result|
        case response.code
          when 200
            parse(response.body)
          else
            raise "DIGA API ERROR(code=#{response.code}): #{response.body}"
        end
      end            
    end
    
    def post(url, params)
      RestClient.post("#{endpoint}/#{url}", params) do |response, request, result|
        case response.code
          when 200
            #parse(response.body)
          else
            raise "DIGA API ERROR(code=#{response.code}): #{response.body}"
        end
      end                
    end  
  end
end

