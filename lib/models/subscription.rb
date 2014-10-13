class Subscription
  attr_accessor :subscriber, :subscribed

  def initialize(subscriber, subscribed)
    @subscriber = subscriber
    @subscribed = subscribed
  end
end
