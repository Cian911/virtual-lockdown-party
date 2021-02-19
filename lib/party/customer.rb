# frozen_string_literal: true

require 'json'

module Party
  class ReadError < StandardError; end

  class ParseError < StandardError; end

  class Customer
    attr_accessor :file, :contents

    def initialize(file)
      @file = file
      @contents = nil
    end

    def customers
      read_file
      parse_file
    end

    private

    def read_file
      @contents = File.read(@file)
    rescue StandardError => e
      raise Party::ReadError, "Error reading #{@file}: #{e}"
    end

    def parse_file
      @contents.each_line.map do |l|
        parse_line(l)
      rescue StandardError => e
        raise Party::ParseError, "Error parsing line: #{e}"
      end
    end

    def parse_line(line)
      parsed_line = JSON.parse(line)
      {
        user_id: Integer(parsed_line['user_id'].to_s, 10),
        name: parsed_line['name'].to_s,
        cords: CustomerPoint.new(Float(parsed_line['latitude']), Float(parsed_line['longitude']))
      }
    end
  end
end
