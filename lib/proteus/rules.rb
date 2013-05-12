require 'proteus/rules/git'
require 'proteus/logging'

module Proteus
  class Rules
    include Proteus::Logging
    # TODO: I think this thing can be turned into a dsl of some kind.
    # e.g. rules {
    #        remote_origin equals "something.com",
    #        directory within "/some/dir"
    #      }
    
    def match(rules)
      rules.each do |rule, value|
        (logger.debug "Rule #{rule} with value #{value} not matched" and return false) unless self.send(rule,value)
        logger.debug "Rule #{rule} with value #{value} matched"
      end 
      logger.debug "All rules matched!"
      return true
    end

    def remote_origin (value)
      matcher = Proteus::Rules::Git::RemoteOrigin.new()
      matcher.match(value)
    end
  end
end
