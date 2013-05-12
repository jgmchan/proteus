require 'uri'
require 'grit'
require 'proteus/logging'
require 'gitable'

module Proteus
  class Rules
    module Git
      class BaseGit 
        include Proteus::Logging
        attr_accessor :repo
        def initialize(repo=Dir.pwd)
          @repo = Grit::Repo.new(repo)
        end
      end

      class RemoteOrigin < BaseGit
        def match(value)
          # If value is a uri, then parse it
          host = Gitable::URI.parse(value).host || value
          url = Gitable::URI.parse(@repo.config['remote.origin.url'])
          logger.debug "Host: #{host}"
          logger.debug "Remote URL: #{url}"
          logger.info "Matching config host: #{host} to actual host: #{url.host}"
          host == url.host
        end
      end
    end
  end
end
