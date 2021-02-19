# frozen_string_literal: true

Dir['./lib/party/*.rb'].each { |file| require file }

customers_file = './data/customers.txt'
output_file = 'output.txt'

Party::Invitation.new(customers_file, output_file).invite

puts "\nOutput file created - see output.txt\n"
