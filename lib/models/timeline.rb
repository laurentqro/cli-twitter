class Timeline
  def self.show_for(user)
    output = ""
    user.messages.each do |message|
      output += "#{message.text}\n"
    end
    output
  end
end
