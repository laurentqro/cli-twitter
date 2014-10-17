require_relative '../lib/application'

describe Subscription do
  let(:charlie) { User.new('Charlie') }
  let(:alice) { User.new('Alice') }

  subject(:subscription) { Subscription.new(:charlie, :alice) }

  it "exists" do
    expect(subject).to be_kind_of(Subscription)
  end

  it "has a subscriber" do
    expect(subject.subscriber).to eql :charlie
  end

  it "has a subscribee" do
    expect(subject.subscribee).to eql :alice
  end

end
