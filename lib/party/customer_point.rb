# frozen_string_literal: true

module Party
  class CustomerPoint
    attr_reader :lat, :lng

    def initialize(lat, lng)
      validate_cords(lat, lng)

      @lat = lat
      @lng = lng
    end

    def lat_lng
      [@lat, @lng]
    end

    def lat_lng_to_rad
      [deg_to_rad(@lat), deg_to_rad(@lng)]
    end

    def deg_to_rad(deg)
      deg * (Math::PI / 180)
    end

    private

    # Lat must be between -90 & 90. Lng must be between -180 & 180
    # https://en.wikipedia.org/wiki/Latitude#The_graticule_on_the_sphere
    def validate_cords(lat, lng)
      raise ArgumentError, "Invalid latitude: #{lat}" unless (-90..90).cover?(lat)
      raise ArgumentError, "Invalid longitude: #{lng}" unless (-180..180).cover?(lng)
    end
  end
end
