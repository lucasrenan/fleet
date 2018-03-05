require 'spec_helper'

RSpec.describe Fleet::Validator do
  let(:calculator) { Fleet::Calculator.new(scooters, manager_capacity, engineer_capacity) }
  let(:scooters) { [15, 5] }
  let(:manager_capacity) { 10 }
  let(:engineer_capacity) { 5 }

  describe '#validate!' do
    subject { described_class.new(calculator).validate! }

    context 'when districts are out of range' do
      let(:scooters) { [] }

      it 'raises DistrictsError' do
        expect { subject }.to raise_error(Fleet::DistrictsError)
      end
    end

    context 'when scooter element is out of range' do
      let(:scooters) { [9999] }

      it 'raises ScootersError' do
        expect { subject }.to raise_error(Fleet::ScootersError)
      end
    end

    context 'when manager capacity is out of range' do
      let(:manager_capacity) { 1000 }

      it 'raises ManagerCapacityError' do
        expect { subject }.to raise_error(Fleet::ManagerCapacityError)
      end
    end

    context 'when engineer capacity is out of range' do
      let(:engineer_capacity) { 1111 }

      it 'raises EngineerCapacityError' do
        expect { subject }.to raise_error(Fleet::EngineerCapacityError)
      end
    end
  end
end
