module TwitterCli
  class User
    attr_accessor :name, :messages, :followers, :following

    @@users = []

    def initialize(name)
      @name = name
      @messages = []
      @followers = []
      @following = []
      @@users << self
    end

    def self.users
      @@users
    end

    def publish(text)
      message = TwitterCli::Message.new({ text: text, author: self.name })
      @messages << message
      message
    end

    def follow(user)
      self.following << user
      user.followers << self
    end

    def timeline
      timeline_messages = sort_by_publication_date(messages)
      format_timeline_output(timeline_messages)
    end

    def wall
      wall_messages = messages + get_followed_users_messages
      wall_messages = sort_by_publication_date(wall_messages)
      format_wall_output(wall_messages)
    end

    private

    def get_followed_users_messages
      following.any? ? following.map(&:messages).flatten : []
    end

    def sort_by_publication_date(messages)
      messages.sort_by(&:publication_date).reverse!
    end

    def format_wall_output(messages)
      messages.map { |message| "#{message.author} - #{message.text}" }.join("\n")
    end

    def format_timeline_output(messages)
      messages.map { |message| "#{message.text}" }.join("\n")
    end
  end
end
