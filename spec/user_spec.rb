require_relative '../lib/application'

describe TwitterCli::User do
  subject(:alice) { TwitterCli::User.new('Alice') }

  it "exists" do
    expect(subject).to be_kind_of(TwitterCli::User)
  end

  it "has a name" do
    expect(subject.name).to eql 'Alice'
  end

  describe "#publish" do
    it "publishes a message" do
      message = subject.publish('I love the weather today')
      expect(subject.messages).to include(message)
    end
  end

  describe "#follow" do
    it "subscribes a user to another user's timeline" do
      bob = TwitterCli::User.new('Bob')
      alice = TwitterCli::User.new("Alice")
      expect{ alice.follow(bob) }.to change{ bob.followers.count }.by(1)
      expect{ alice.follow(bob) }.to change{ alice.following.count }.by(1)
    end
  end

  describe "#followers" do
    it "returns a list of followers" do
      bob = TwitterCli::User.new('Bob')
      alice = TwitterCli::User.new("Alice")
      alice.follow(bob)
      expect(bob.followers).to include alice
    end
  end

  describe "#following" do
    it "returns a list of followed users" do
      bob = TwitterCli::User.new('Bob')
      alice = TwitterCli::User.new("Alice")
      alice.follow(bob)
      expect(alice.following).to include bob
    end
  end

  describe "#timeline" do

    before(:example) do
      subject.publish('I love the weather today')
    end

    it "returns a string" do
      expect(subject.timeline).to be_kind_of(String)
    end

    it "returns a formatted the user's timeline" do
      expect(subject.timeline).to include 'I love the weather today'
    end

  end

  describe "#wall" do
    before(:example) do
      @alice = TwitterCli::User.new('Alice')
      @bob = TwitterCli::User.new('Bob')
      @charlie = TwitterCli::User.new('Charlie')

      @charlie_message = @charlie.publish({ text: 'I\'m in New York today! Anyone want to have a coffee?', author: "Charlie" })
      @alice_message = @alice.publish({ text: 'I love the weather today', author: "Alice" })
      @bob_message = @bob.publish({ text: 'Damn! We lost!', author: "Bob" })

      @charlie.follow(@alice)
      @charlie.follow(@bob)
    end

    it "returns a string" do
      expect(@charlie.wall).to be_kind_of(String)
    end

    it "returns the user's own messages" do
      expect(@charlie.wall).to include 'I\'m in New York today! Anyone want to have a coffee?'
    end

    it "returns the messages of the followed users" do
      expect(@charlie.wall).to include 'I love the weather today' && 'Damn! We lost!'
    end
  end

end
