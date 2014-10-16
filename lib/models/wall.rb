class Wall

  def self.for(user)
    messages = user.subscribers.map(&:messages)
    messages << user.messages
    messages.flatten.sort_by(&:publication_date).reverse!
  end

end
