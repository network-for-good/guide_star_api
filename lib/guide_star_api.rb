# frozen_string_literal: true

require 'guide_star_api/version'
require 'guide_star_api/configuration'
require 'guide_star_api/essentials'
require 'guide_star_api/premier'

# Provides basic flexirest interface for searching GuideStar APIs
# @see https://apiportal.guidestar.org/
module GuideStarApi
  module_function

  # Yield the module's configuration instance back to the caller
  # @yieldparam config [GuideStarApi::Configuration]
  def configure
    yield configuration
  end

  # @return [GuideStarApi::Configuration] the module's configuration instance
  def configuration
    @configuration ||= Configuration.new
  end
end
