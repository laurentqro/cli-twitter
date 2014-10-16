require_relative '../lib/application'

describe User do
  subject(:alice) { User.new('Alice') }

  it "exists" do
    expect(subject).to be_kind_of(User)
  end

  it "has a name" do
    expect(subject.name).to eql 'Alice'
  end

  it "publishes a message" do
    message = subject.publish('I love the weather today')
    expect(subject.messages).to include(message)
  end

  it "subscribes to another user's timeline" do
    user = User.new('Bob')
    subscription = subject.subscribe_to(user)
    expect(subject.subscriptions).to include subscription
  end

end
