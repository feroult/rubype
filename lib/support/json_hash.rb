module Support
  class JSONHash < Hash  
    def method_missing(method, *args, &block)
      self[method] if has_key? method
    end
  end      
end
