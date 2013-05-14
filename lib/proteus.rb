require "proteus/execute"
require "logger"

module Proteus
  LOGGER = ::Logger.new STDOUT
  LOGGER.level = Logger::WARN
  LOGGER.warn "Jeffrey, this is your concious"
end
