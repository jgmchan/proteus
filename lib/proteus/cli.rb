require 'thor'
require 'proteus'

module Proteus
  class CLI < Thor
    package_name "proteus"

    desc "init", "Initialize a basic configuration"
    def init
    end
  end
end

