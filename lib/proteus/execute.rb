require 'proteus/config'
require 'proteus/rules'
require 'proteus/logging'
require 'grit'

module Proteus
  class Execute
    include Proteus::Logging
    def run!
      # Collect the config based on the rules
      config = nil
      config_obj.load_conf.each do |config_item|
        config = config_item['config']
        break if rules.match(config_item['rules'])
      end
      # Apply the configs
      config.each do |key, value|
        logger.debug "Setting git local config #{key} to #{value}"
        self.gitrepo.config[key] = value
      end
    end

    def gitrepo(dir=Dir.pwd)
      Grit::Repo.new(dir)
    end

    def config_obj
      Config.new()
    end

    def rules
      Rules.new()
    end
  end
end
