module Calculations
  class Speed
    TOLERANCE = 7

    def self.average(time_a, time_b, total_distance)
      average_speed = total_distance / time_a + time_b * 3.6
      average_speed - average_speed * (TOLERANCE / 100)
    end
  end
end