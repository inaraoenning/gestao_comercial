// classes abstratas
import 'dart:convert';
import 'package:flutter_gestao_comercial/src/data/http/http_client.dart';
import 'package:flutter_gestao_comercial/src/data/models/cliente.dart';
import 'package:flutter_gestao_comercial/src/data/http/exceptions.dart';

abstract class IClienteRepository {
  Future<List<Cliente>> getClientes();
}

class ClienteRepository implements IClienteRepository {
  final IHttpClient httpClient;

  ClienteRepository({required this.httpClient});

  @override
  Future<List<Cliente>> getClientes() async {
    final response = await httpClient.get(
      'https://gestao-comercial-api.onrender.com',
    );

    if (response.statusCode == 200) {
      final List<Cliente> clientes = [];

      final body = jsonDecode(response.body);

      body['clientes'].map((item) {
        final Cliente cliente = Cliente.fromMap(item);
        clientes.add(cliente);
      }).toList();
      return clientes;
    } else if (response.statusCode == 404) {
      throw notFoundException('A URL informada não é válida');
    } else {
      throw Exception('Erro ao buscar clientes');
    }
  }
}
