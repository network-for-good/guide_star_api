# frozen_string_literal: true

RSpec.describe GuideStarApi::Essentials do
  include_context 'with subscription keys'
  include GuideStarEssentialsStubs # TODO: can record these using VCR

  before do
    GuideStarApi.configure { |config| config.essentials_subscription_key = 'yourGuideStarAPIKey' }
  end

  context '.search' do
    subject { GuideStarApi::Essentials.search(search_terms: search_terms) }

    context 'when the search term is for a valid EIN that guidestar tracks' do
      before do
        stub_search_with_term_that_returns_a_single_result(search_terms)
      end

      let(:search_terms) { '68-0480736' }

      it 'returns a result object with 1 item' do
        expect(subject.size).to eq(1)
        expect(subject.first.organization_name).to eq('Network for Good, Inc.')
      end
    end

    context 'when the search term is for an EIN for which there is no match at GuideStar' do
      before do
        stub_search_with_term_that_returns_no_results(search_terms)
      end

      let(:search_terms) { '52-1111111' }

      it 'returns a error' do
        expect { subject }.to raise_error(Flexirest::HTTPNotFoundClientException)
      end
    end
  end
end
