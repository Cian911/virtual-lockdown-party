# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Party::Customer do
  let(:subject) { described_class.new(file).customers }
  let(:file) { './spec/fixtures/customers.txt' }

  describe '#customers' do
    context 'when given a valid file' do
      it 'reads & parses file into correct format' do
        customers = subject

        expect(customers.dig(0, :name)).to eq('Christina McArdle')
        expect(customers.dig(0, :user_id)).to eq(12)
        expect(customers.dig(0, :cords).lat_lng).to eq([52.986375, -6.043701])
      end
    end

    context 'when given an file which doesnt exist' do
      let(:file) { './idontexist.txt' }

      it 'raises a read error' do
        expect { subject }.to raise_error(Party::ReadError)
      end
    end

    context 'when given an invalid file' do
      let(:file) { './spec/fixtures/invalid_customers.txt' }

      it 'raises a parse error' do
        expect { subject }.to raise_error(Party::ParseError)
      end
    end

    context 'when lat or lat is not present' do
      let(:file) { '{"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": ""}' }

      it 'raises an error' do
        expect { subject }.to raise_error(Party::ReadError)
      end
    end

    context 'when user_id is not present' do
      let(:file) { '{"latitude": "52.986375", "user_id": nil, "name": "Christina McArdle", "longitude": "-7.02"}' }

      it 'raises an error' do
        expect { subject }.to raise_error(Party::ReadError)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
