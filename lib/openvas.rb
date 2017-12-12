# frozen_string_literal: true

require 'openvas/version'

require 'openvas/config'
require 'openvas/client'
require 'openvas/auth'

require 'openvas/scans'
require 'openvas/reports'
require 'openvas/results'

module Openvas
  module_function

  def configure
    block_given? ? yield(Config) : Config
    %w[url username password].each do |key|
      next unless Openvas::Config.instance_variable_get("@#{key}").nil?
      raise Openvas::Config::RequiredOptionMissing,
            "Configuration parameter missing: '#{key}'. " \
            'Please add it to the Openvas.configure block'
    end
  end
  alias config configure
end
