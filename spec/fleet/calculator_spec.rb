require 'spec_helper'

RSpec.describe Fleet::Calculator do
  describe '#fleet_engineers' do
    test_data = [
      {scooters: [15, 10], manager: 12, engineers: 5, expected: 3},
      {scooters: [11, 15, 13], manager: 9, engineers: 5, expected: 7},
      {scooters: [11, 15, 13, 5], manager: 9, engineers: 5, expected: 8}
    ]

    test_data.each do |data|
      context "given scooters: #{data[:scooters]}, manager: #{data[:manager]}, engineers: #{data[:engineers]}" do
        it 'calculates the minimum number of engineers' do
          calculator = described_class.new(data[:scooters],
                                           data[:manager],
                                           data[:engineers])

          expect(calculator.fleet_engineers).to eq(data[:expected])
        end
      end
    end
  end
end
