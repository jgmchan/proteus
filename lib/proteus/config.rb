require 'yaml'
require 'Proteus/logging'

module Proteus
  class Config
    include Proteus::Logging
    CONFIG_FILE = "/Users/jeff/.proteus.yml"

    attr_accessor :config
    attr_accessor :config_file

    def initialize(options={})
      @config = options
    end

    def load_conf(file = CONFIG_FILE)
      logger.debug "Loading configuration file: #{file}"
      raise("No config file available: #{file}") unless File.exists?(file)
      @config_file = file
      @config['data'] = YAML.load_file(@config_file)
    end
  end
end
