# GOF Design Patterns em Ruby

Implementação dos padrões de Design GOF (Group of Four) em classes Ruby com a finalidade de simular um Radar Fixo de Trânsito.

## Descrição:
O governo do estado de Santa Catarina necessita a criação de um software para controle de radares de fiscalização de velocidade.
A necessidade se dá pelo desenvolvimento de um software que se comunique com o hardware atualmente instalado nas rodovias do estado e processe os dados coletados pelo hardware.
Cada radar é composto de um sensor de presença, uma câmera fotográfica e uma Central de Processamento.

## Requerimentos:

* Ruby 2.6
* [Gem Daemons](https://github.com/thuehlinger/daemons)
* [Gem PDFKit](https://github.com/pdfkit/pdfkit)
* [Gem WKHtmlToPDF Binary](https://github.com/zakird/wkhtmltopdf_binary_gem)

### Padrões usados no Projeto:

* [Adapter](observer.md): ajuda construir um sistema altamente integrado, sustentável e evita o acoplamento entre classes.
* [Singleton](singleton.md): mantém uma única instância de uma certa classe em toda a aplicação.
* [Strategy](strategy.md): alterna partes do algoritmo em tempo de execução.