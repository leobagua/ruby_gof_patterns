module Core
  class Central
    require "singleton"
    include Singleton

    SPEED_LIMIT = 80
    SENSOR_A_TO_B_DISTANCE = 0.75
    SENSOR_B_TO_C_DISTANCE = 0.75

    def update(subject)
      puts "#{Time.now} - New Sensor readings received.\n"
      puts "#{Time.now} - Calculating a new averaged Speed of the vehicle.\n"

      time, readings = subject.reading
      readed_speed = calculate_average_speed(readings['time_a'], readings['time_b'])
      if readed_speed > SPEED_LIMIT
        puts "#{Time.now} - Taking the license plate photo.\n"
        photo = take_photo

        puts "#{Time.now} - Calculating the fine.\n"
        fine = calculate_fine readed_speed

        puts "#{Time.now} - Generating the ticket.\n\n"
        generate_ticket readed_speed, time, fine, photo
      end
    end

    private

    def calculate_average_speed(time_a, time_b)
      Calculations::Speed.average(time_a, time_b, SENSOR_A_TO_B_DISTANCE + SENSOR_B_TO_C_DISTANCE)
    end

    def take_photo
      Image::Camera.take_photo
    end

    def calculate_fine(average_speed)
      Calculations::Fine.perform(SPEED_LIMIT, average_speed)
    end

    def generate_ticket(readed_speed, time, fine, photo)
      html_formatter = Reports::HTMLFormatter.new(readed_speed, SPEED_LIMIT, time, fine, photo)
      plain_text_formatter = Reports::PlainTextFormatter.new(readed_speed, SPEED_LIMIT, time, fine, photo)
      Reports::Ticket.new(html_formatter).generate
      Reports::Ticket.new(plain_text_formatter).generate
    end
  end
end