require "ruby_wasi/version"
require "ruby_wasi/countries"
require "httparty"

module RubyWasi
  class API
    include HTTParty

    attr_accessor :host, :path, :api_token, :company_id, :debug
    base_uri 'https://api.wasi.co/'


    def initialize(company_id, apikey, debug=false)
      @path = '/v1'
      raise Error, 'You must provide a Wasi API key' unless apikey
      raise Error, 'You must provide a Wasi Company Id' unless company_id
      @api_token = apikey
      @company_id = company_id
    end

    def get(url, params={})
      options= {
        :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      }
      path = "#{@path}/#{url}?id_company=#{@company_id}&wasi_token=#{@api_token}"
      JSON.parse(self.class.get(path, options).body)
    end

    def countries
      RubyWasi::Countries.new(self)
    end

  end
end
