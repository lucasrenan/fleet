module Fleet
  class Validator
    DISTRICT_RANGE = 1..100
    SCOOTERS_RANGE = 0..1000
    MANAGER_RANGE  = 1..999
    ENGINEER_RANGE = 1..1000

    attr_accessor :calculator

    def initialize(calculator)
      @calculator = calculator
    end

    def validate!
      validate_district
      validate_scooters
      validate_manager
      validate_engineer
    end

  private
    def validate_district
      unless DISTRICT_RANGE.cover?(calculator.scooters.size)
        raise DistrictsError, "districts should contain between #{DISTRICT_RANGE} elements"
      end
    end

    def validate_scooters
      calculator.scooters.each do |scooters_number|
        unless SCOOTERS_RANGE.cover?(scooters_number)
          raise ScootersError, "scooter elements should be between #{SCOOTERS_RANGE}"
        end
      end
    end

    def validate_manager
      unless MANAGER_RANGE.cover?(calculator.manager_capacity)
        raise ManagerCapacityError, "manager capacity should be between #{MANAGER_RANGE}"
      end
    end

    def validate_engineer
      unless ENGINEER_RANGE.cover?(calculator.engineer_capacity)
        raise EngineerCapacityError, "engineer capacity should be between #{ENGINEER_RANGE}"
      end
    end
  end

  class DistrictsError < StandardError; end
  class ScootersError < StandardError; end
  class ManagerCapacityError < StandardError; end
  class EngineerCapacityError < StandardError; end
end
