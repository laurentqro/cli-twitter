class Message
  attr_reader :text, :publication_date

  def initialize(text)
    @text = text
    @publication_date = Time.now
  end
end
