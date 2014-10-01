require 'httparty'

module OfficeAutopilotApi
  class Request

    include HTTParty
    base_uri 'https://api.ontraport.com'
    format :plain

  end
end
