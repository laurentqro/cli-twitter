Given(/^I start the app with "(.*?)"$/) do |command|
  @io = StringIO.new
  @app = Terminal.new(command.split(/\s+/), @io)
end

Given(/^I enter "(.*?)"$/) do |command|
  @app.interpret(command)
end

Then(/^I should see$/) do |string|
  @io.rewind
  expect(@io.read.gsub(/^(\n)*|(\n)*$/, "")).to eql string
end
