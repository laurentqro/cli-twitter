class User
  attr_accessor :name, :messages, :subscriptions

  def initialize(name)
    @name = name
    @messages = []
    @subscriptions = []
  end

  def publish(message)
    @messages << message
  end

  def subscribe_to(another_user)
    @subscriptions << Subscription.new(self, another_user)
  end
end
