# GuideStarApi

A simple wrapper for the https://data.guidestar.org/ API V2.

## Installation

Add this line to your application's Gemfile:

    gem 'guide_star_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guide_star_api

## Usage

### Configure

Pretty straightforward - just configure with a GuideStar API key (typically in a Rails initializer).

``` ruby
GuideStarApi.configure do |config|
  config.essentials_subscription_key = 'yourGuideStarAPIKey'
end
```

### Search

Pass accepted `search_terms` params into the search method, as defined here: https://apiportal.guidestar.org/docs/services/microservices.api.search/export?DocumentFormat=Swagger

``` ruby
GuideStarApi::Essentials.search(search_terms: '68-0480734')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Re-recording API fixtures

The [Premier API specs](./spec/lib/premier_spec.rb) use [VCR](https://github.com/vcr/vcr) to playback GuideStar API responses. The test suite filters out subscription keys. In order to re-record the fixture, run the following command with a valid subscriber key:

```
GUIDESTAR_API_VCR_MODE=rec GUIDESTAR_API_PREMIER_KEY=################################ rs spec/lib/premier_spec.rb
```

You do not need to specify any `ENV` values in normal development; only when it is necessary to re-record the VCR fixture data. See `spec_helper.rb` and the [VCR docs](https://relishapp.com/vcr/vcr/v/5-0-0/docs/configuration/filter-sensitive-data) for configuration details.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/guide_star_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GuideStarApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/guide_star_api/blob/master/CODE_OF_CONDUCT.md).
