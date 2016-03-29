module Xotelia
  class Client
    attr_accessor :api_key, :api_secret

    URL = 'https://admin.xotelia.com/'

    def initialize(api_token)
      @api_token = api_token || self.class.api_token || ENV['XOTELIA_API_TOKEN']
      @api_token = @api_token.strip if @api_token

      raise Xotelia::CredentialsMissingError, 'API Token is missing' unless @api_secret or @api_key
      raise Xotelia::CredentialsInvalidError, 'Invalid API Token' unless self.ping['data'] == 'pong'
    end

    def ping
      call_api(:get, 'ping')
    end

    def bookings(start_date, end_date)
      call_api(:get, 'bookings', {start_date: start_date.to_date, end_date: end_date.to_date})
    end

    protected
      def call_api(call_type, call_method, json_data = nil)
        json_data_converted = json_data ? json_data.to_json : ''
        endpoint = "/api/#{call_method}"
        endpoint = "#{endpoint}?#{json_data.to_query}" if json_data and call_type == :get

        conn = Faraday.new(:url => URL) do |faraday|
          faraday.request  :url_encoded
          # faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end

        response = conn.send(call_type) do |req|
          req.url endpoint
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Bearer #{self.api_token}"
          req.body = json_data_converted if req.method == :post
        end

        JSON.parse(response.body)
      end
  end
end
