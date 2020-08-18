# frozen_string_literal: true

RSpec.shared_context 'with subscription keys' do
  before do
    GuideStarApi.configure do |config|
      # This allows us to re-record real API interactions by setting temporary ENV variables,
      # which get filtered-out of the VCR data using the .filter_sensitive_data method in spec_helper.rb.
      # You don't need to set these variables unless you are recording new API interactions
      # or re-recording existing interactions
      # See https://relishapp.com/vcr/vcr/v/5-0-0/docs/configuration/filter-sensitive-data
      config.essentials_subscription_key = ENV.fetch('GUIDESTAR_API_ESSENTIALS_KEY', 'DUMMY_ESSENTIALS_KEY')
      config.premier_subscription_key = ENV.fetch('GUIDESTAR_API_PREMIER_KEY', 'DUMMY_PREMIER_KEY')
    end
  end
end
