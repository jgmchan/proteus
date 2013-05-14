require 'proteus/rules/git'

module Proteus
  class Rules
    # TODO: I think this thing can be turned into a dsl of some kind.
    # e.g. rules {
    #        remote_origin equals "something.com",
    #        directory within "/some/dir"
    #      }
    
    def match(rules)
      rules.each do |rule, value|
        (Logger.debug "Rule #{rule} with value #{value} not matched" and return false) unless self.send(rule,value)
        Logger.debug "Rule #{rule} with value #{value} matched"
      end 
      Logger.debug "All rules matched!"
      return true
    end

    def remote_origin (value)
      matcher = Proteus::Rules::Git::RemoteOrigin.new()
      matcher.match(value)
    end
  end
end
