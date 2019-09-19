module Sensor
  class Monitor
    require 'yaml'

    attr_reader :reading, :readings_file_path, :actual_file_state, :central_observer

    def initialize(central_observer)
      @readings_file_path = File.expand_path('../monitoring/readings.yml', File.dirname(__FILE__))
      @actual_file_state = YAML.load_file(@readings_file_path)
      @central_observer = central_observer
      start_monitoring
    end

    def reading=(new_reading)
      @reading = new_reading
      notify_central
    end

    def notify_central
      puts "#{Time.now} - Generating a new Notification to the Central.\n"
      @central_observer.update(self)
    end

    private

    def start_monitoring
      loop do
        sleep 1
        if any_readings?
          changes = YAML.load_file(@readings_file_path).to_a - @actual_file_state.to_a
          @actual_file_state = YAML.load_file(@readings_file_path)
          self.reading = changes.first
        end
      end
    end

    def any_readings?
      YAML.load_file(@readings_file_path) != @actual_file_state
    end
  end
end