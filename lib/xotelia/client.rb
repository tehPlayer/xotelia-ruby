module Xotelia
  class Client
    include Xotelia::Connection
    include Xotelia::Bookings

    attr_accessor :api_token

    def initialize(api_token = nil)
      @api_token = api_token || ENV['XOTELIA_API_TOKEN']
      @api_token = @api_token.strip if @api_token

      raise Xotelia::CredentialsMissingError, 'API Token is missing' unless @api_token
    end
  end
end
