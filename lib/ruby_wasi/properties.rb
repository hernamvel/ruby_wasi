require 'ruby_wasi/base'
require 'pry'
module RubyWasi
  class Properties < Base

    def initialize(api_instance)
      super(api_instance)
    end

    def all
      params = {take: 100}
      offset = 0
      properties = []
      call_result =  build_properties(@api_instance.get('property/search', params))
      while call_result.empty? == false do
        call_result.each {|x| properties.push(x)}
        offset += 100
        params[:skip] = offset
        call_result = build_properties(@api_instance.get('property/search', params))
      end
      properties
    end

    private
    def build_properties(records)
      result = []
      for i in 0..100
        key = i.to_s
        result.push(records[key]) if records[key]
      end
      result
    end
  end
end