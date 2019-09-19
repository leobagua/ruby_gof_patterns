module Reports
  class Ticket
    require "pdfkit"

    attr_accessor :formatter

    def initialize(formatter)
      @formatter = formatter
    end

    def generate
      pdf = PDFKit.new(@formatter.output)
      pdf.to_file(File.expand_path("../../generated_tickets/traffic_ticket_#{Time.now.to_i}.pdf", File.dirname(__FILE__)))
    end
  end
end