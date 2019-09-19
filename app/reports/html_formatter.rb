module Reports
  class HTMLFormatter

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
        #{output_head}
        #{output_body}
      HTML
    end

    private

    def output_head
      "<img src='#{}' />"
      <<-HTML
          <title>New Traffic Ticket</title>
          <style>
            h1 {
                margin: 25px;
            }
            table {
                width: 100%;
            }
            table, th, td {
                border: 1px solid black;
             }
            body {
                padding: 15px;
            }
            div {
                display: inline-flex;
            }
            div > img {
                width: 10%;
                height: auto;
            }
          </style>
      HTML
    end

    def output_body
      <<-HTML
        <body>
          <div>
            <img src="#{@sc_flag}" />
            <h1>State of Santa Catarina</h1>
          </div>
          <h2>New Traffic Ticket</h2>
          <table style="width: 100%;">
            <thead>
              <tr>
                <th>License Plate</th>
                <th>Speed Limit</th>
                <th>Readed Speed</th>
                <th>Occurrence Date</th>
                <th>Fine</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>XXX-0000</td>
                <td>#{@speed_limit} Km/h</td>
                <td>#{@readed_speed} Km/h</td>
                <td>#{@time}</td>
                <td>R$ #{@fine}</td>
              </tr>
              <tr>
                <td colspan="5">
                  <img src="#{@photo}" />
                </td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="5"><b>Generated in #{Time.now}</b></td>
              </tr>
             </tfoot>
          </table>
          </body>
      HTML
    end
  end
end