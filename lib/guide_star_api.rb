# frozen_string_literal: true

require "guide_star_api/version"
require "guide_star_api/configuration"
require "guide_star_api/essentials"

module GuideStarApi
  class Error < StandardError; end

  class << self
    attr_reader :configuration

    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration
      @configuration = Configuration.new
    end
  end
end
