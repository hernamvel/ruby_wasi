require 'ruby_wasi/base'

module RubyWasi
  class Countries < Base

    def initialize(api_instance)
      super(api_instance)
    end

    def all
      @api_instance.get('location/all-countries')
    end
  end
end