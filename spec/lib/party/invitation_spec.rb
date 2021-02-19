# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Party::Invitation do
  let(:subject) { described_class.new(customers_file, output_file) }
  let(:output_file) { './spec/fixtures/output.txt' }
  let(:customers_file) { './spec/fixtures/customers.txt' }

  describe '#invite' do
    context 'when given a valid list of customers' do
      before do
        subject.invite
      end

      it 'creates a file with a list of customers in range of the office' do
        expect(File.exist?(output_file)).to be_truthy
      end

      it 'contents are in correct order' do
        contents = File.open(output_file).to_a

        expect(contents.first.to_s).to eq("UserID: 4 - Name: Ian Kehoe\n")
        expect(contents.last.to_s).to eq("UserID: 39 - Name: Lisa Ahearn\n")
      end
    end
  end
end
