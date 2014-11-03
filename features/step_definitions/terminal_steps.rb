require 'timecop'

Given(/^I start the app with "(.*?)"$/) do |command|
  @controller = TwitterCli::Controller
  @io = StringIO.new
  @app = Terminal.new(command.split(/\s+/), @io, @controller)
end

Given(/^I enter "(.*?)"$/) do |command|
  @app.interpret(command)
end

Given(/^I entered "(.*?)" (\d+) minutes? ago$/) do |command, minutes_ago|
  seconds_ago = minutes_ago.to_f * 60.0
  Timecop.freeze(Time.now - seconds_ago) do
    @app.interpret(command)
  end
end

Given(/^I entered "(.*?)" (\d+) seconds? ago$/) do |command, seconds_ago|
  Timecop.freeze(Time.now - seconds_ago.to_f) do
    @app.interpret(command)
  end
end

Then(/^I should see$/) do |string|
  @io.rewind
  expect(@io.read.gsub(/^(\n)*|(\n)*$/, "")).to eql string
end
