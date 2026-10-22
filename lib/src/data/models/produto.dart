class Produto {
  final int? id;
  final String name;
  final String description;
  final int price;
  final int stock;
  final bool active;

  const Produto({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.active,
  });

  // converte JSON recebido da API em objeto Dart
  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
        id: json['id'] as int?,
        name: json['nome'],
        description: json['descricao'],
        price: (json['preco']).toDouble(),
        stock: json['estoque'] ?? 0,
        active: json['ativo'] ?? true,
      );

  Map<String, dynamic> toJson() => {
        'nome': name,
        'descricao': description,
        'preco': price,
        'estoque': stock,
        'ativo': active,
      };
}

// [
//   {
//     "id": 3,
//     "nome": "Monitor 24 polegadas",
//     "descricao": "Monitor Full HD",
//     "preco": 899.9,
//     "estoque": 10,
//     "ativo": true
//   },
//   {
//     "id": 4,
//     "nome": "Web Cam Logitec",
//     "descricao": "24 MegaPixel",
//     "preco": 450,
//     "estoque": 10,
//     "ativo": true
//   }
//   }
