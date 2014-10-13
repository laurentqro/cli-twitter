require_relative '../lib/application'

describe Message do
  let(:bob) { User.new('Bob') }
  subject(:message) { Message.new(:text => 'Good game though.', :user => :bob) }

  it "belongs to a user" do
    expect(subject.user).to eql :bob
  end

  it "has a timestamp" do
    expect(subject.publication_date).to be_kind_of(Time)
  end
end
