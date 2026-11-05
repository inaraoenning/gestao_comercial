import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gestao_comercial/models/cliente.dart';
import 'package:flutter_gestao_comercial/models/produto.dart';
import 'package:flutter_gestao_comercial/models/venda.dart';

// testes simples pra conferir se o json da api
// vira objeto direitinho
void main() {
  test('cliente vira objeto a partir do json', () {
    final c = Cliente.fromJson({
      'id': 1,
      'nome': 'Ana',
      'documento': '123',
      'ativo': true,
    });

    expect(c.id, 1);
    expect(c.nome, 'Ana');
    expect(c.ativo, true);
  });

  test('preco inteiro vira double no produto', () {
    final p = Produto.fromJson({
      'id': 2,
      'nome': 'Mouse',
      'preco': 59,
      'estoque': 10,
      'ativo': true,
    });

    expect(p.preco, 59.0);
    expect(p.preco, isA<double>());
  });

  test('venda monta os itens da lista do json', () {
    final v = Venda.fromJson({
      'id': 1,
      'cliente': {'id': 1, 'nome': 'Ana'},
      'dataHora': '2026-11-03T10:00:00',
      'status': 'CONCLUIDA',
      'valorTotal': 119.8,
      'itens': [
        {
          'id': 1,
          'tipo': 'PRODUTO',
          'referenciaId': 2,
          'descricao': 'Mouse',
          'quantidade': 2,
          'valorUnitario': 59.9,
          'subtotal': 119.8,
        },
      ],
    });

    expect(v.cliente.nome, 'Ana');
    expect(v.itens.length, 1);
    expect(v.itens.first.descricao, 'Mouse');
  });
}
