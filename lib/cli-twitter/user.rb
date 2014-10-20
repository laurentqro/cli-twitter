class User
  attr_accessor :name, :messages, :followers, :following

  def initialize(name)
    @name = name
    @messages = []
    @followers = []
    @following = []
  end

  def publish(text)
    message = Message.new({ text: text, author: self.name })
    @messages << message
    message
  end

  def follow(user)
    self.following << user
    user.followers << self
  end

  def timeline
    messages.sort_by(&:publication_date).reverse!
    messages.map do |message|
      "#{message.text} (#{message.publication_date})"
    end
    .join("\n")
  end

  def wall
    wall_messages = messages + get_followed_users_messages
    sort_by_publication_date(wall_messages)
    format_wall_output(wall_messages)
  end

  private

  def get_followed_users_messages
    following.map(&:messages)
  end

  def sort_by_publication_date(messages)
    messages.flatten!.sort_by(&:publication_date).reverse!
  end

  def format_wall_output(messages)
    messages.map do |message|
      "#{message.author} - #{message.text} (#{message.publication_date})"
    end
    .join("\n")
  end
end
