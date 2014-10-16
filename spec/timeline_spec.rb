require_relative '../lib/application'

describe Timeline do

  describe "#for" do
    it "formats and displays a user's timeline" do
      alice = User.new('Alice')
      alice.publish('I love the weather today')
      expect(Timeline.for(alice)).to include 'I love the weather today'
    end
  end

end
