require 'guide_star_stubs'

RSpec.describe GuideStarApi do
  it "has a version number" do
    expect(GuideStarApi::VERSION).not_to be nil
  end

  it "should allow to set subscription key" do
    GuideStarApi.configure { |config| config.essentials_subscription_key = 'yourGuideStarAPIKey' }
    expect(GuideStarApi.configuration.essentials_subscription_key).to eq 'yourGuideStarAPIKey'
  end

  describe "Essentials" do
    include GuideStarStubs

    before do
      GuideStarApi.configure { |config| config.essentials_subscription_key = 'yourGuideStarAPIKey' }
    end

    context ".search" do
      subject { GuideStarApi::Essentials.search(search_terms) }

      context 'when the search term is for a valid ein that guidestar tracks' do
        before do
          stub_search_with_term_that_returns_a_single_result(search_terms)
        end

        let(:search_terms) { '68-0480736' }

        it 'returns a result object with 1 item' do
          expect(subject.size).to eq(1)
          expect(subject.first.organization_name).to eq("Network for Good, Inc.")
        end
      end

      context 'when the search term is for an ein for which there is no match at GuideStar' do
        before do
          stub_search_with_term_that_returns_no_results(search_terms)
        end

        let(:search_terms) { '52-1111111' }

        it 'returns a result object with empty data' do
          expect(subject.size).to eq(0)
          expect(subject.first).to be_nil
        end
      end
    end
  end
end
