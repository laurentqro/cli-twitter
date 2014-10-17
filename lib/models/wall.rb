class Wall

  def self.for(user)
    messages = get_wall_messages_for(user)
    format_display_of(messages)
  end

  private

  def self.get_wall_messages_for(user)
    messages = user.following.map(&:messages)
    messages << user.messages
    messages.flatten.sort_by(&:publication_date).reverse!
  end

  def self.format_display_of(messages)
    output = messages.map do |message|
      "#{message.author} - #{message.text} (#{message.publication_date})"
    end
    output.join("\n")
  end

end
