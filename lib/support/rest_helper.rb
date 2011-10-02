module Support
  module RestHelper
    def get(url, params = {})
      #p "#{domain}/#{url}"
      RestClient.get(url, :params => split_params(params)) do |response, request, result|
        case response.code
          when 200
            parse(response.body)
          else
            raise "Buscape API error(code=#{response.code}): #{response.body}"
        end
      end            
    end
    
    def post(url, params)
      RestClient.post(url, params) do |response, request, result|
        case response.code
          when 200
            #parse(response.body)
          else
            raise "Buscape API error(code=#{response.code}): #{response.body}"
        end
      end                
    end  

    private     
      def parse(text)
        JSON.parse(text, :symbolize_names => true, :object_class => Support::JSONHash)
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
      
  end
end

