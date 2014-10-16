require_relative '../lib/application'

describe Wall do

  before(:example) do
    @alice = User.new('Alice')
    @bob = User.new('Bob')
    @charlie = User.new('Charlie')

    @charlie.publish('I\'m in New York today! Anyone want to have a coffee?')
    @alice_message = @alice.publish('I love the weather today')
    @bob_message = @bob.publish('Damn! We lost!')

    @charlie.subscribe_to(@alice)
    @charlie.subscribe_to(@bob)
  end

  describe "#for" do
    it "contains the messages of followed users" do
      expect(Wall.for(@charlie)).to include @alice_message && @bob_message
    end

    it "displays messages sorted most recent first"

  end
end
