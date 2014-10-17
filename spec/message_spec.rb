require_relative '../lib/application'

describe Message do
  let(:bob) { User.new('Bob') }
  subject(:message) { Message.new({ text: 'Good game though.', author: 'Bob' }) }

  it "has a timestamp" do
    expect(subject.publication_date).to be_kind_of(Time)
  end

  it "has an author" do
    expect(subject.author).to eql 'Bob'
  end
end
