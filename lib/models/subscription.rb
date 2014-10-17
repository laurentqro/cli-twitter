class Subscription
  attr_accessor :subscriber, :subscribee

  def initialize(subscriber, subscribee)
    @subscriber = subscriber
    @subscribee = subscribee
  end
end
