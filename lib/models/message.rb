class Message
  attr_reader :text, :user, :publication_date

  def initialize(args)
    @text = args[:text]
    @user = args[:user]
    @publication_date = Time.now
  end
end
