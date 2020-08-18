# frozen_string_literal: true

require 'bundler/setup'
require 'webmock/rspec'
require 'vcr'

require 'guide_star_api'
Dir["#{__dir__}/support/**/*.rb"].sort.each { |f| require f }

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# see https://github.com/vcr/vcr#usage
VCR.configure do |vcr_config|
  # Setting this to 'rec' allows to re-recorded previously-stored interactions
  # see https://relishapp.com/vcr/vcr/v/5-0-0/docs/record-modes/
  vcr_mode = ENV['GUIDESTAR_API_VCR_MODE'] == 'rec' ? :all : :once

  vcr_config.default_cassette_options = {
    record: vcr_mode,
    match_requests_on: %i[method host path]
  }

  vcr_config.cassette_library_dir = "#{__dir__}/fixtures/"
  vcr_config.hook_into :webmock

  GuideStarApi.configure do |api_config|
    vcr_config.filter_sensitive_data('<ESSENTIALS_SUBSCRIPTION_KEY>') do
      api_config.essentials_subscription_key
    end

    vcr_config.filter_sensitive_data('<PREMIER_SUBSCRIPTION_KEY>') do
      api_config.premier_subscription_key
    end
  end
end
