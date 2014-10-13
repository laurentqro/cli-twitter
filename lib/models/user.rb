class User
  attr_accessor :name, :messages

  def initialize(name)
    @name = name
    @messages = []
  end

  def publish(message)
    @messages << message
  end
end
