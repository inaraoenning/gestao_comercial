# gestao_comercial

Front-end didático em Flutter para a API Gestão Comercial.

## Pré-requisitos

- Flutter SDK instalado (versão estável recente)
- Dispositivo conectado: navegador (Chrome), emulador Android ou dispositivo físico

## Como executar

1. Instale as dependências:

```bash
flutter pub get
```

2. Rode a aplicação:

```bash
# no navegador (recomendado para começar)
flutter run -d chrome

# no emulador/dispositivo Android
flutter run

# em outro dispositivo, liste os disponíveis com:
flutter devices
```

3. Testes:

```bash
flutter test
```

## Configurando a URL da API

A URL base da API fica em `lib/config/api_config.dart` e já aponta por padrão
para `https://gestao-comercial-api.onrender.com/api`.

Para apontar para outra API sem mexer no código, use `--dart-define`:

```bash
flutter run -d chrome --dart-define=API_URL=http://localhost:8080/api
```

> Atenção: ao rodar no **emulador Android**, `localhost` não funciona — use
> `http://10.0.2.2:8080/api` para acessar a API local da sua máquina.
> No **navegador**, `http://localhost:8080/api` funciona normalmente.

## Estrutura do Projeto

O app é dividido em 5 telas: Home, Clientes, Produtos, Serviços e Vendas,
com CRUD completo consumindo a API REST.

- lib/
  - main.dart (ponto de entrada)
  - app.dart (widget raiz do MaterialApp)
  - config/api_config.dart (URL base da API)
  - models/ (modelos de dados: cliente, produto, serviço, venda)
  - services/api_service.dart (todas as chamadas HTTP)
  - pages/ (telas: home, clientes, produtos, serviços, vendas)
  - widgets/ui_helpers.dart (widgets e helpers reutilizáveis)
- test/widget_test.dart (testes dos modelos/fromJson)

## Dependencias

Fica em pubspec.yaml

- http: ^1.6.0 (para requisições HTTP)
- intl: ^0.19.0 (para formatação de moeda brasileira e datas)

## Modelagem de Dados

A API responde em formato JSON (texto estruturado).
Dart precisa converter esse texto em objetos tipados (classes)

- fromJson
  Converte o mapa (JSON) recebido da API para objeto DART

- toJson
  Pega o objeto DART da tela e converte para JSON para enviar no corpo das requisições POST/PUT

- models/ (modelos de dados)
  - venda.dart (modelo de venda)
  - cliente.dart (modelo de cliente)
  - produto.dart (modelo de produto)
  - servico.dart (modelo de serviço)
