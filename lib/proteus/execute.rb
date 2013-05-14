require 'proteus/config'
require 'proteus/rules'
require 'proteus/logging'
require 'grit'

module Proteus
  class Execute
    include Proteus::Logging
    attr_accessor :repo
    attr_accessor :config

    def gitrepo(dir=Dir.pwd)
      @repo = @repo || Grit::Repo.new(dir)
    end

    def config_obj
      Config.new()
    end

    def rules
      Rules.new()
    end

    def find_configs
      config_obj.load_conf.each do |config_item|
        @config = config_item['config']
        break if rules.match(config_item['rules'])
      end
    end

    def apply_configs
      @config.each do |key, value|
        logger.debug "Setting git local config #{key} to #{value}"
        self.gitrepo.config[key] = value
      end
    end

    def run!
      # Don't bother running if we're not in a git repo
      begin
        gitrepo
      rescue Grit::InvalidGitRepositoryError
        logger.debug "Current directory #{Dir.pwd} is not a git repository"
        exit
      end

      find_configs
      apply_configs
    end
  end
end
