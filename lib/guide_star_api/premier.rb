# frozen_string_literal: true

require 'flexirest'

module GuideStarApi
  # Searches the GuideStar Premier API, returning richer data than the Essentials API
  # @see https://apiportal.guidestar.org/api-static-documentation-v3
  # @see https://apiportal.guidestar.org/docs/services/microservices.api.profile/operations/5e9857f563b518201fe624b3/console
  class Premier < Flexirest::Base
    before_request :add_authentication_details
    verbose true

    request_body_type :json

    base_url 'https://apidata.guidestar.org/premier/v3'

    # @!method search(id)
    #   Query the GuideStar Premier API for an organization with EIN +id+
    #   @param [String] the EIN of interest
    #   @raise [Flexirest::RequestException] when API response errors occur
    get :search, '/:id'

    private

    def add_authentication_details(_, request)
      request.headers['Subscription-Key'] = GuideStarApi.configuration.premier_subscription_key
    end
  end
end
