# Singleton Pattern

## Descrição:

No padrão Singleton, o acesso ao construtor é restrito para que ele não possa ser instanciado.
Portanto, a criação da instância única é feita dentro da classe e é mantida como uma variável de classe.
Ele pode ser acessado através de um getter do objeto.

## Example
A Classe Central é uma feature que se estende para toda a aplicação. Então uma única instância dessa classe
é criada e armazenada como uma variável para ser usada por toda a aplicação.

```ruby
class Central

  @@instance = Central.new

  def self.instance
    return @@instance
  end

  private_class_method :new
  
  def any_instance_method
    puts 'I am a instance method! :D'
  end
end
```

Então, ao chamar o método `instance` teremos o objeto instanciado.

```ruby
Core::Central.instance.any_instance_method
```
`I am a instance method! :D`

E se tentarmos chamar o método `new` da classe Central

```ruby
central = Core::Central.new
```
```ruby 
private method 'new' called for Core::Central:Class (NoMethodError)
```