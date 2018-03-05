module Fleet
  class Calculator
    attr_reader :engineer_capacity, :manager_capacity, :scooters

    def initialize(scooters, manager_capacity, engineer_capacity)
      @scooters = scooters
      @manager_capacity = manager_capacity
      @engineer_capacity = engineer_capacity
    end

    def fleet_engineers
      Fleet::Validator.new(self).validate!

      total_engineers = 0
      max_engineers_saved = 0

      scooters.each do |scooters_number|
        engineers = possible_engineers_needed(scooters_number)
        engineers_with_manager = possible_engineers_with_manager(scooters_number)

        engineers_saved = possible_engineers_saved(engineers, engineers_with_manager)
        max_engineers_saved = engineers_saved if engineers_saved > max_engineers_saved

        total_engineers += engineers
      end

      total_engineers - max_engineers_saved
    end

  private
    def possible_engineers_needed(scooters_number)
      (scooters_number / engineer_capacity.to_f).ceil
    end

    def possible_engineers_with_manager(scooters_number)
      remaining_scooters = scooters_number - manager_capacity
      [(remaining_scooters / engineer_capacity.to_f).ceil.to_i, 0].max
    end

    def possible_engineers_saved(engineers, engineers_with_manager)
      engineers - engineers_with_manager
    end
  end
end
