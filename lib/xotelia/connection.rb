module Xotelia
  module Connection
    URL = 'https://admin.xotelia.com/'

    def call_api(call_type, call_method, json_data = nil)
      json_data_converted = json_data ? json_data.to_json : ''
      endpoint = "/api/#{call_method}"

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