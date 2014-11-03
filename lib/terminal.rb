require_relative 'cli-twitter/application'

class Terminal
  def initialize(args)
    @controller = args[:controller]
    @stdout = args[:io]
  end

  def interpret(command)
    @stdout.puts "#{@controller.parse(command)}" unless @controller.parse(command) == nil
  end
end
