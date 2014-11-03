require 'timecop'

Given(/^"(.*?)" posted "(.*?)" (\d+) minutes? ago$/) do |user, message, minutes_ago|
	seconds_ago = minutes_ago.to_f * 60.0
	command = "#{user} -> #{message}"
	Timecop.freeze(Time.now - seconds_ago) do
		@app.interpret(command)
	end
end

Given(/^"(.*?)" posted "(.*?)" (\d+) seconds? ago$/) do |user, message, seconds_ago|
	command = "#{user} -> #{message}"
	Timecop.freeze(Time.now - seconds_ago.to_f) do
		@app.interpret(command)
	end
end

Given(/^"(.*?)" follows "(.*?)"$/) do |follower, followed|
  command = "#{follower} follows #{followed}"
  @app.interpret(command)
end

When(/^I check "(.*?)"'s wall$/) do |user|
	command = "#{user} wall"
  @app.interpret(command)
end

When(/^I check "(.*?)"'s timeline$/) do |user|
	command = user
	@app.interpret(command)
end

Then(/^I should see$/) do |string|
  @io.rewind
  expect(@io.read.gsub(/^(\n)*|(\n)*$/, "")).to eql string
end
