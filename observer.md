# Observer Pattern

## Descrição:

Se quisermos que algum componente (observador) conheça as atividades de outro (sujeito), 
podemos simplesmente conectar as duas classes e informar o primeiro sobre algumas ações executadas no segundo. 
Isso significa que devemos passar uma referência ao observador quando criarmos uma instância do sujeito e chamar alguns de seus métodos quando o sujeito mudar.

## Example
A Classe Monitor irá notificar a classe Central quando detectar uma leitura de sinal.

```ruby
  class Monitor
    require 'yaml'
    
     def initialize(central_observer)
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
  end
```

```ruby
central_observer = Core::Central.instance
Sensor::Monitor.new(central_observer)
```