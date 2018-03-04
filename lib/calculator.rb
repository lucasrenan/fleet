class Calculator
  attr_reader :engineer_capacity, :manager_capacity, :scooters

  def initialize(scooters, manager_capacity, engineer_capacity)
    @scooters = scooters
    @manager_capacity = manager_capacity
    @engineer_capacity = engineer_capacity
  end

  def fleet_engineers
    total_engineers = 0
    max_engineers_savings = 0

    scooters.each do |s|
      engineers = 0
      engineers_with_manager = 0
      engineers_savings = 0

      engineers = (s / engineer_capacity.to_f).ceil
      total_engineers += engineers

      engineers_with_manager = [((s - manager_capacity) / engineer_capacity.to_f).ceil, 0].max

      engineers_savings = engineers - engineers_with_manager.to_i
      if (engineers_savings > max_engineers_savings)
        max_engineers_savings = engineers_savings
      end
    end

    total_engineers - max_engineers_savings
  end
end
