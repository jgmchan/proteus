require 'logger'

module Proteus
  module Logging
    @logger = nil

    def logger
      @logger ||= create_logger
    end

    def get_log_level
      Logger::DEBUG
    end

    def create_logger
      logger = Logger.new(STDOUT)
      logger.level = get_log_level
      classname = self.class.name
      calling_line = caller[1][/\/([^\/]*:\d+):/, 1]
      logger.progname = "#{classname}/#{calling_line}"
      logger
    end
  end
end
