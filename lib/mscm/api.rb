# frozen_string_literal: true

require 'grape'
require 'mscm/api/api_v1'

module MSCM
  ##
  # API of Music School and Courses Management Software backend
  #
  class API < Grape::API
    mount APIv1
  end
end
