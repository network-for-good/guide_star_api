# frozen_string_literal: true

module GuideStarApi
  class Configuration
    attr_accessor :essentials_subscription_key
    attr_accessor :sandbox

    ESSENTIALS_ENDPOINT = "https://apidata.guidestar.org/essentials/v2"
    ESSENTIALS_SANDBOX_ENDPOINT = "https://apidata.guidestar.org/essentials/v2"

    def sandbox?
      @sandbox
    end

    private

    def initialize
      @sandbox = false
    end
  end
end