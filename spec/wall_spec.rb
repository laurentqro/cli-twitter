require_relative '../lib/application'

describe Wall do

  before(:example) do
    @alice = User.new('Alice')
    @bob = User.new('Bob')
    @charlie = User.new('Charlie')

    @charlie_message = @charlie.publish({ text: 'I\'m in New York today! Anyone want to have a coffee?', author: "Charlie" })
    @alice_message = @alice.publish({ text: 'I love the weather today', author: "Alice" })
    @bob_message = @bob.publish({ text: 'Damn! We lost!', author: "Bob" })

    @charlie.follow(@alice)
    @charlie.follow(@bob)
  end

  describe "#get_wall_messages_for" do
    it "contains the messages of followed users" do
      expect(Wall.get_wall_messages_for(@charlie)).to include @alice_message && @bob_message
    end

    it "lists messages sorted most recent first" do
      wall_messages = Wall.get_wall_messages_for(@charlie)

      expect([wall_messages[0], wall_messages[1], wall_messages[2]]).to eql [@bob_message, @charlie_message, @alice_message].sort_by(&:publication_date).reverse!
    end

    it "formats and displays a user's wall" do
      expect(Wall.for(@charlie)).to include "I\'m in New York today! Anyone want to have a coffee?" && "I love the weather today" && "Damn! We lost!"
    end

  end
end
