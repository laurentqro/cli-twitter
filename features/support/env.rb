require File.dirname(__FILE__) + '/../../lib/terminal'

Before do
	@io = StringIO.new
	@app = Terminal.new(args = { controller: TwitterCli::Controller, io: @io })
end
