require_relative '../lib/application'

describe Message do
  let(:bob) { User.new('Bob') }
  subject(:message) { Message.new(:text => 'Good game though.', :user => :bob) }

  it "has a timestamp" do
    expect(subject.publication_date).to be_kind_of(Time)
  end
end
