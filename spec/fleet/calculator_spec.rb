require 'spec_helper'

RSpec.describe Fleet::Calculator do
  describe '#fleet_engineers' do
    test_data = [
      {scooters: [15, 10], manager_capacity: 12, engineer_capacity: 5, expected: 3},
      {scooters: [11, 15, 13], manager_capacity: 9, engineer_capacity: 5, expected: 7},
      {scooters: [11, 15, 13, 5], manager_capacity: 9, engineer_capacity: 5, expected: 8}
    ]

    test_data.each do |data|
      context "given scooters: #{data[:scooters]}, manager_capacity: #{data[:manager_capacity]}, engineer_capacity: #{data[:engineer_capacity]}" do
        it 'calculates the minimum number of engineer_capacity' do
          calculator = described_class.new(data[:scooters],
                                           data[:manager_capacity],
                                           data[:engineer_capacity])

          expect(calculator.fleet_engineers).to eq(data[:expected])
        end
      end
    end
  end
end
