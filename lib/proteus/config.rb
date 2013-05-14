require 'yaml'

module Proteus
  class Config
    CONFIG_FILE = File.expand_path("~/.proteus.yaml")

    attr_accessor :config
    attr_accessor :config_file

    def initialize(options={})
      @config = options
    end

    def load_conf(file = CONFIG_FILE)
      Logger.debug "Loading configuration file: #{file}"
      raise("No config file available: #{file}") unless File.exists?(file)
      @config_file = file
      @config['data'] = YAML.load_file(@config_file)
    end
  end
end
