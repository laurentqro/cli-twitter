class Message
  attr_reader :text, :author, :publication_date

  def initialize(args = {})
    @text = args[:text]
    @author = args[:author]
    @publication_date = Time.now
  end
end
