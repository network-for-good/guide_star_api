# frozen_string_literal: true

module GuideStarApi
  class Essentials < Flexirest::Base
    # search requires that a search_terms value gets passed to the call
    # i.e. GuideStarApi::Essentials.search(search_terms: '68-0480734')

    # documentation: https://apiportal.guidestar.org/api-static-documentation-v2
    before_request :add_authentication_details
    verbose true

    request_body_type :json
    
    base_url 'https://apidata.guidestar.org/essentials/v2'

    post :search, "/", ignore_root: %w[data hits]

    private

    def add_authentication_details(_name, request)
      request.headers["Subscription-Key"] = GuidestarSearch.configuration.essentials_subscription_key
    end
  end
end
