require 'oyster'
require_relative 'cli-twitter/application'
require_relative 'helpers/time_in_words'

class Terminal
  BIN_SPEC = Oyster.spec do
    string :command
  end

  def initialize(argv, io, controller)
    @controller = controller
    @options = BIN_SPEC.parse(argv)
    @stdout = io
  end

  def interpret(command)
    @stdout.puts "#{@controller.parse(command)}" unless @controller.parse(command) == nil
  end
end
