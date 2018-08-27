require "test_helper"

class RubyWasiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RubyWasi::VERSION
  end

  def test_all_countries
    wrapper = RubyWasi::API.new(ENV['company_id'],ENV['wasi_token'])
    result =  wrapper.countries.all_countries
    assert result['status'], 'success'
  end
end
