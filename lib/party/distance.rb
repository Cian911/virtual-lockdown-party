# frozen_string_literal: true

module Party
  class Distance
    ARC = (Math::PI / 180)
    EARTH_RADIUS = 6371

    class << self
      # rubocop:disable Style/OptionalBooleanParameter
      # rubocop:disable Metrics/MethodLength
      def distance(cords_a, cords_b, miles = false)
        # https://en.wikipedia.org/wiki/Great-circle_distance
        lat1, lng1 = cords_a
        lat2, lng2 = cords_b

        dlat = to_rads((lat2 - lat1))
        dlng = to_rads((lng2 - lng1))

        a = Math.sin(dlat / 2) *
            Math.sin(dlat / 2) +
            Math.cos(lat1 * ARC) *
            Math.cos(lat2 * ARC) *
            Math.sin(dlng / 2) * Math.sin(dlng / 2)
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
        EARTH_RADIUS * c * (miles ? 1 / 1.6 : 1)
      end
      # rubocop:enable Style/OptionalBooleanParameter
      # rubocop:enable Metrics/MethodLength

      def to_rads(deg)
        deg * ARC
      end
    end
  end
end
