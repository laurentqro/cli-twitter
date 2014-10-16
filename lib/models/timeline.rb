class Timeline

  def self.for(user)
    user.messages.map { |message| "#{message.text}, #{message.publication_date}" }.join("\n")
  end

end
