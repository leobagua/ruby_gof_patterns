# Strategy Pattern

## Descrição:

Para evitar problemas introduzidos por herança, devemos usar delegação. 
Em vez de criar subclasses (como no padrão 'Template Method'), separamos a parte variável do código e o isolamos em sua própria classe. 
A idéia principal desse padrão é definir uma família de objetos (estratégias), no qual todos fazem (quase) a mesma coisa e suportam a mesma interface. 
Então, podemos usar essas classes isoladas de código como partes intercambiáveis.

## Example
A Classe Ticket irá gerar dois tipos de formato, HTML ou Texto Puro.

```ruby
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
```

```ruby
  class HTMLFormatter
    def output
      <<-HTML
        #{output_head}
        #{output_body}
      HTML
    end
  end
```

```ruby
  class PlainTextFormatter
    def output
      <<-HTML
      Readed Speed: #{@readed_speed} | Speed Limit: #{@speed_limit} | Fine: #{@fine}
      HTML
    end
  end
```

```ruby
Reports::Ticket.new(Reports::HTMLFormatter.new).generate
Reports::Ticket.new(Reports::PlainTextFormatter.new).generate
```