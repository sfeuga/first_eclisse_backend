# frozen_string_literal: true

require 'grape'
# require 'logging'
require 'rack-timeout'
require 'rack/cors'

Bundler.setup(:default)
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")

require 'dotenv'
Dotenv.load

require 'mscm'

# require_relative 'config/logging'
# require_relative 'config/rollbar'

# use Rollbar::Middleware::Sinatra

use Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: %i[get post put delete patch options]
  end
end

# Gzip compression
use Rack::Deflater

run MSCM::API

use Rack::Timeout, service_timeout: (ENV['WEB_TIMEOUT'].to_i || 30)
