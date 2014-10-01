require 'office_autopilot_api'

require 'cgi'
require 'webmock/rspec'


# disallow all non-local connections
#WebMock.disable_net_connect!(:allow_localhost => true)


RSpec.configure do |config|
end


def test_data(file_name)
  File.read(File.join(File.dirname(__FILE__), 'data', file_name))
end

def api_endpoint
  "https://api.ontraport.com"
end

def escape_xml(xml)
  CGI.escape(xml).gsub('+', '%20')
end
