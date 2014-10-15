require_relative '../lib/application'

describe Timeline do

  describe "#show_for" do
    it "shows a user's messages" do
      bob = User.new('Bob')
      bob.publish(Message.new("Good game though."))
      bob.publish(Message.new("Damn! We lost!"))
      expect(Timeline.show_for(bob)).to include "Good game though." && "Damn! We lost!"
    end
  end

  describe "#show" do
    it "shows an aggregated list of all subscriptions"
  end

  describe "#subscribe" do
    it "subscribes a user to another user's timeline"
  end

end
