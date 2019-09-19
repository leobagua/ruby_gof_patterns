module Reports
  class PlainTextFormatter

    attr_reader :readed_speed, :limit_speed, :time, :fine, :photo

    def initialize(readed_speed, speed_limit, time, fine, photo)
      @readed_speed = readed_speed
      @speed_limit = speed_limit
      @time = time
      @fine = fine
      @photo = photo
      @sc_flag = File.expand_path("../../assets/flag.png", File.dirname(__FILE__))
    end

    def output
      <<-HTML
      Readed Speed: #{@readed_speed} | Speed Limit: #{@speed_limit} | Fine: #{@fine}
      HTML
    end
  end
end