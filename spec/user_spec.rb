require_relative '../lib/application'

describe User do
  subject(:alice) { User.new('Alice') }

  let(:bob) { User.new('Bob') }
  let(:message) { Message.new('I love the weather today', :alice) }

  it "exists" do
    expect(subject).to be_kind_of(User)
  end

  it "has a name" do
    expect(subject.name).to eql 'Alice'
  end

  it "publishes a message" do
    subject.publish(:message)
    expect(subject.messages).to include(:message)
  end

  it "subscribes to another user" do
    subject.subscribe_to(:bob)
    expect(subject.subscriptions.count).to eql 1
    expect(subject.subscriptions.last.subscribed).to eql :bob
  end

end
