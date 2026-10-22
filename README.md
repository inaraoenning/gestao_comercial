# gestao_comercial

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dependencias

Fica em pubspec.yaml

- http: ^1.5.0 (para requisições HTTP)
- intl: ^0.19.0 (para formatação de moeda brasileira e datas)

## Estrutura do Projeto

- lib/
  - main.dart (ponto de entrada)
  - models/ (modelos de dados)
  - services/ (serviços de API)
  - widgets/ (widgets reutilizáveis)
  - screens/ (telas da aplicação)

## URL da API

- config/ (configurações globais)
  - api_config.dart (URL base da API)

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
  - usuario.dart (modelo de usuario)
