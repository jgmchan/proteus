require 'thor'
require 'proteus'

module Proteus
  class CLI < Thor
    package_name "proteus"

    desc "init", "Initialize a basic configuration"
    def init
      #TODO:
      # 1. Generate the config file if it's not there
      # 2. Alias the git command  in the relevant shell to call proteus
      #   e.g. alias git='proteus start || git $@'
    end

    desc "start", "Run proteus"
    method_option :debug, :type => :boolean, :default => false
    def start
      Logger.level = ::Logger::DEBUG if options[:debug]
      Proteus::Execute.new.run!
    end
  end
end
