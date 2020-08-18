# frozen_string_literal: true

module GuideStarApi
  # Container for module-wide configuration
  class Configuration
    # @return [String] authorizes access to the Essentials API
    attr_accessor :essentials_subscription_key

    # @return [String] authorizes access to the Premier API
    attr_accessor :premier_subscription_key
  end
end
