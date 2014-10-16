class Wall

  def self.for(user)
    messages = user.subscribers.map(&:messages).flatten
  end

end
