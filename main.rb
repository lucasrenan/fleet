require_relative './lib/calculator'

c = Calculator.new([15, 10], 12, 5)
puts c.fleet_engineers

puts

c = Calculator.new([11, 15, 13], 9, 5)
puts c.fleet_engineers

puts

c = Calculator.new([11, 15, 13, 5], 9, 5)
puts c.fleet_engineers
