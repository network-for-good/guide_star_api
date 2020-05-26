# frozen_string_literal: true
require "flexirest"

module GuideStarApi
  class Essentials < Flexirest::Base
    # search requires that a search_terms value gets passed to the call
    # i.e. GuideStarApi::Essentials.search(search_terms: '68-0480734')

    # documentation: https://apiportal.guidestar.org/api-static-documentation-v2
    before_request :add_authentication_details
    verbose true

    request_body_type :json
    
    base_url 'https://apidata.guidestar.org/essentials/v2'

    post :lookup, "/", ignore_root: %w[data hits]

    def self.search(search_terms)
      lookup(search_terms: search_terms)
    rescue Flexirest::HTTPNotFoundClientException, Flexirest::TimeoutException
      # return an empty iterator with 0 results
      Flexirest::ResultIterator.new
    end

    private

    def add_authentication_details(_name, request)
      request.headers["Subscription-Key"] = GuideStarApi.configuration.essentials_subscription_key
    end
  end
end
