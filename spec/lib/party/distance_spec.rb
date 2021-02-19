# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Party::Distance do
  let(:subject) { described_class.distance(cords_a, cords_b, false) }
  # Intercom Office
  let(:cords_a) { Party::CustomerPoint.new(53.349722, -6.260278).lat_lng }
  # Enfield
  let(:cords_b) { Party::CustomerPoint.new(53.407075, -6.833496).lat_lng }
  let(:max_distance) { 100 }

  describe '.distance' do
    context 'when given a valid set of cords' do
      it 'retruns the distance between two points' do
        expect(subject).to be_between(0, max_distance)
      end
    end

    context 'when given cords in London' do
      let(:cords_b) { Party::CustomerPoint.new(51.5074, 0.1278).lat_lng }

      it 'should give a distance of 400km+' do
        expect(subject).to be_between(400, 500)
      end
    end

    context 'when given cords in london with miles' do
      let(:subject) { described_class.distance(cords_a, cords_b, true) }
      let(:cords_b) { Party::CustomerPoint.new(51.5074, 0.1278).lat_lng }

      it 'should give a distance of 200m+' do
        expect(subject).to be_between(200, 300)
      end
    end
  end
end
