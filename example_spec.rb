Bundler.require

require 'active_support/all'

describe "issue identifying appropriate stub with ActiveSupport::TimeWithZone" do
  subject { double }

  let(:day_range) { now.beginning_of_day..now.end_of_day}
  let(:month_range) { now.beginning_of_month..now.end_of_month}

  before do
    Time.zone = 'GMT'
    allow(subject).to receive(:foo).with(day_range).and_return(:bar)
    allow(subject).to receive(:foo).with(month_range).and_return(:baz)
  end

  context "When using ActiveSupport::TimeWithZone" do
    let(:now) { Time.zone.now }

    it "does not throw an error" do
      subject.foo(day_range)
    end
  end

  context "When using ActiveSupport::TimeWithZone" do
    let(:now) { Time.now }

    it "does not throw an error" do
      subject.foo(day_range)
    end
  end
end
