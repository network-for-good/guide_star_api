# frozen_string_literal: true

RSpec.describe GuideStarApi::Premier do
  include_context 'with subscription keys'

  let(:ein) { '52-6001143' }

  it '.search returns Premier data about an organization' do
    result = VCR.use_cassette('premier_api') do
      result = subject.search(ein)
    end

    result.data[:summary].tap do |summary|
      aggregate_failures do
        expect(summary[:organization_name]).to eq('Enoch Pratt Free Library of Baltimore City')
        expect(summary[:ntee_code]).to eq('B70 - Educational Institutions')
        expect(summary[:naics_code][:naics_code]).to eq('519120')
      end
    end
  end
end
