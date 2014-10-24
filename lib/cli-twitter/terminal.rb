require 'oyster'
require_relative 'cli-twitter/application'

module TwitterCli
  class Terminal
    BIN_SPEC = Oyster.spec do
      string :command
    end

    def initialize(argv, io)
      @options = BIN_SPEC.parse(argv)
      @stdout = io
    end

    def interpret(command)
      @stdout.puts "#{TwitterCli::Controller.parse(command)}"
    end
  end
end
