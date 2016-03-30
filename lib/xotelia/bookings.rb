module Xotelia
  module Bookings
    def list_bookings(start_date, end_date)
      call_api(:get, "bookings?start_date=#{start_date.to_date.to_json}&end_date=#{end_date.to_date.to_json}")
    end

    def create_booking(ota, params = {})
      call_api(:post, 'bookings/#{ota}', params)
    end

    def update_booking(ota, params = {})
      call_api(:put, 'bookings/#{ota}', params)
    end

    def destroy_booking(ota, params = {})
      call_api(:delete, 'bookings/#{ota}', params)
    end
  end
end