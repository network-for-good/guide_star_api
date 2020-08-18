# frozen_string_literal: true

RSpec.describe GuideStarApi do
  it '.configure yields an instance of GuideStarApi::Configuration' do
    expect do |b|
      subject.configure(&b)
    end.to yield_with_args(an_instance_of(GuideStarApi::Configuration))
  end
end
