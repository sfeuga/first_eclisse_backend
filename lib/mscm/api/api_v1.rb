# frozen_string_literal: true

require 'active_support/notifications'
require 'grape'
require 'grape-swagger'
require 'grape-swagger/entity'
require 'logging'
require 'oj'
require 'oj_mimic_json'

module MSCM
  ##
  # Version 1 of the API
  #
  class APIv1 < Grape::API
    version 'v1', using: :path
    prefix 'api'
    format :json
    formatter :json, ->(object, _env) do
      ActiveSupport::Notifications.instrument('render.json') do
        Oj.dump(object)
      end
    end

    add_swagger_documentation \
      mount_path: '/swagger', # produce the /swagger.json file
      doc_version: '1.0.0',   # Api Version
      info: {
        title: 'opensource Music School and Courses Management backend software',
        description: 'A collection of Music School oriented services',
        contact_name: 'stéphane FEUGA',
        contact_url: 'https://github.com/sfeuga/MSCM-backend',
        contact_email: 'mscm@sfeuga.com'
      }

    route :any, '*path' do
      error!('Not found', 404)
    end
  end
end
