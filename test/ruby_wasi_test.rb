require "test_helper"

class RubyWasiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RubyWasi::VERSION
  end

  def test_all_countries
    wrapper = RubyWasi::API.new(ENV['company_id'],ENV['wasi_token'])
    result =  wrapper.countries.all
    assert result['status'], 'success'
  end

  def test_all_properties
    wrapper = RubyWasi::API.new(ENV['company_id'],ENV['wasi_token'])
    result =  wrapper.properties.all
    result.each do |r|
      assert r['id_property']
      assert_equal r['id_company'].to_s, ENV['company_id']
    end
  end

end
