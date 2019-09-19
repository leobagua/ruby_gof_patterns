module Calculations
  class Fine

    FINE_VALUES = {
        1..20 => 130.16,
        21..50 => 195.33,
        51..999 => 880.41,
    }.freeze

    def self.perform(speed_limit, average_speed)
      difference_speed = average_speed - speed_limit
      percentage_difference = difference_speed / speed_limit * 100
      FINE_VALUES.select { |value| value === percentage_difference }.values.first
    end
  end
end