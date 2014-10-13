require_relative '../lib/application'

describe User do
  subject(:alice) { User.new('Alice') }
  let(:message) { Message.new('I love the weather today', :alice) }

  it "exists" do
    expect(subject).to be_kind_of(User)
  end

  it "has a name" do
    expect(subject.name).to eql 'Alice'
  end

  it "publishes a message" do
    subject.post(:message)
    expect(subject.messages).to include(:message)
  end

end
