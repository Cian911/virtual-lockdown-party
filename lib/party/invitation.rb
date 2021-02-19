# frozen_string_literal: true

module Party
  class Invitation
    MAX_DISTANCE = 100
    OFFICE_LAT = Float(53.339428)
    OFFICE_LNG = Float(-6.257664)

    attr_reader :customers_file, :output_file, :customers, :customers_in_range, :office

    def initialize(customers_file, output_file)
      @customers_file = customers_file
      @output_file = output_file
      @customers = Customer.new(@customers_file).customers
      @office = CustomerPoint.new(OFFICE_LAT, OFFICE_LNG)
      @customers_in_range = []
    end

    def invite
      @customers.map do |customer|
        @customers_in_range << customer if in_range?(customer[:cords].lat_lng)
      end
      @customers_in_range.sort_by! { |c| c[:user_id] }
      output
    end

    private

    def output
      File.open(output_file, 'w') do |f|
        @customers_in_range.map do |c|
          f.write("UserID: #{c[:user_id]} - Name: #{c[:name]}\n")
        end
      end
    end

    def in_range?(cords)
      distance = Distance.distance(@office.lat_lng, cords)
      (0..MAX_DISTANCE).cover?(distance)
    end
  end
end
