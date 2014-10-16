class User
  attr_accessor :name, :messages, :subscriptions

  def initialize(name)
    @name = name
    @messages = []
    @subscriptions = []
  end

  def publish(text)
    message = Message.new(text)
    @messages << message
    message
  end

  def subscribe_to(user)
    subscription = Subscription.new(self, user)
    @subscriptions << subscription
    subscription
  end

  def subscribers
    subscriptions.map { |subscription| subscription.subscribed }
  end
end
