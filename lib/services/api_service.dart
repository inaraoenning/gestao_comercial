import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/api_config.dart';
import '../models/cliente.dart';
import '../models/produto.dart';
import '../models/servico.dart';
import '../models/venda.dart';

// erro personalizado pra mostrar a mensagem que a api mandou
class ApiException implements Exception {
  final String mensagem;
  const ApiException(this.mensagem);

  @override
  String toString() => mensagem;
}

// todas as chamadas http ficam aqui, assim as telas não precisam
// ficar repetindo url, header e tratamento de erro
class ApiService {
  final http.Client _client;

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  static const _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // olha a resposta da api: se deu certo devolve o json,
  // se deu erro joga uma exception com a mensagem que veio de lá
  dynamic _processar(http.Response response) {
    final body = response.body.isEmpty
        ? null
        : jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }

    // a api manda {"mensagem": "..."} quando dá erro
    final mensagem = body is Map ? body['mensagem'] : null;
    throw ApiException(
        mensagem?.toString() ?? 'Erro HTTP ${response.statusCode}.');
  }

  // ---------- CLIENTES ----------

  Future<List<Cliente>> listarClientes() async {
    final response =
        await _client.get(Uri.parse('${ApiConfig.baseUrl}/clientes'));
    return (_processar(response) as List)
        .map((e) => Cliente.fromJson(e))
        .toList();
  }

  // id nulo = registro novo -> POST
  // com id = edição -> PUT
  Future<Cliente> salvarCliente(Cliente cliente) async {
    final uri = cliente.id == null
        ? '${ApiConfig.baseUrl}/clientes'
        : '${ApiConfig.baseUrl}/clientes/${cliente.id}';
    final response = cliente.id == null
        ? await _client.post(Uri.parse(uri),
            headers: _headers, body: jsonEncode(cliente.toJson()))
        : await _client.put(Uri.parse(uri),
            headers: _headers, body: jsonEncode(cliente.toJson()));
    return Cliente.fromJson(_processar(response));
  }

  Future<void> excluirCliente(int id) async {
    _processar(
        await _client.delete(Uri.parse('${ApiConfig.baseUrl}/clientes/$id')));
  }

  // ---------- PRODUTOS ----------

  Future<List<Produto>> listarProdutos() async {
    final response =
        await _client.get(Uri.parse('${ApiConfig.baseUrl}/produtos'));
    return (_processar(response) as List)
        .map((e) => Produto.fromJson(e))
        .toList();
  }

  Future<Produto> salvarProduto(Produto produto) async {
    final uri = produto.id == null
        ? '${ApiConfig.baseUrl}/produtos'
        : '${ApiConfig.baseUrl}/produtos/${produto.id}';
    final response = produto.id == null
        ? await _client.post(Uri.parse(uri),
            headers: _headers, body: jsonEncode(produto.toJson()))
        : await _client.put(Uri.parse(uri),
            headers: _headers, body: jsonEncode(produto.toJson()));
    return Produto.fromJson(_processar(response));
  }

  Future<void> excluirProduto(int id) async {
    _processar(
        await _client.delete(Uri.parse('${ApiConfig.baseUrl}/produtos/$id')));
  }

  // ---------- SERVIÇOS ----------

  Future<List<Servico>> listarServicos() async {
    final response =
        await _client.get(Uri.parse('${ApiConfig.baseUrl}/servicos'));
    return (_processar(response) as List)
        .map((e) => Servico.fromJson(e))
        .toList();
  }

  Future<Servico> salvarServico(Servico servico) async {
    final uri = servico.id == null
        ? '${ApiConfig.baseUrl}/servicos'
        : '${ApiConfig.baseUrl}/servicos/${servico.id}';
    final response = servico.id == null
        ? await _client.post(Uri.parse(uri),
            headers: _headers, body: jsonEncode(servico.toJson()))
        : await _client.put(Uri.parse(uri),
            headers: _headers, body: jsonEncode(servico.toJson()));
    return Servico.fromJson(_processar(response));
  }

  Future<void> excluirServico(int id) async {
    _processar(
        await _client.delete(Uri.parse('${ApiConfig.baseUrl}/servicos/$id')));
  }

  // ---------- VENDAS ----------

  Future<List<Venda>> listarVendas() async {
    final response =
        await _client.get(Uri.parse('${ApiConfig.baseUrl}/vendas'));
    return (_processar(response) as List)
        .map((e) => Venda.fromJson(e))
        .toList();
  }

  // só manda o cliente e os itens, quem calcula preço,
  // total e baixa no estoque é a api
  Future<Venda> criarVenda(
      {required int clienteId,
      required List<Map<String, dynamic>> itens}) async {
    final response = await _client.post(
      Uri.parse('${ApiConfig.baseUrl}/vendas'),
      headers: _headers,
      body: jsonEncode({'clienteId': clienteId, 'itens': itens}),
    );
    return Venda.fromJson(_processar(response));
  }

  // patch pra só mudar o status pra cancelada
  // a api devolve o estoque dos produtos sozinha
  Future<Venda> cancelarVenda(int id) async {
    final response = await _client
        .patch(Uri.parse('${ApiConfig.baseUrl}/vendas/$id/cancelamento'));
    return Venda.fromJson(_processar(response));
  }
}
