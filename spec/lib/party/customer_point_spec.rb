# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Party::CustomerPoint do
  let(:subject) { described_class.new(lat, lng) }
  let(:lat) { 53.761389 }
  let(:lng) { -7.2875 }

  describe '.new' do
    context 'when given a valid set of cords' do
      it 'does not raise an error' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when not given a set of valid cords' do
      let(:lat) { -230.000 }
      let(:lng) { 56.70 }

      it 'raises an error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#lat_lng_to_rad' do
    it 'returns an array of cords as radians' do
      expect(subject.lat_lng_to_rad).to match_array([0.9383132484954618, -0.12719086923908676])
    end
  end
end
