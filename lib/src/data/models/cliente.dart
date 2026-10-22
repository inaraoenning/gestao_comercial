class Cliente {
  final int? id;
  final String name;
  final String document;
  final String email;
  final String phone;
  final String address;
  final bool active;

  const Cliente({
    this.id,
    required this.name,
    required this.document,
    required this.email,
    required this.phone,
    required this.address,
    required this.active,
  });

// converte JSON recebido da API em objeto Dart
  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json['id'] as int?,
        name: json['name'],
        document: json['document'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        active: json['active'] ?? true,
      );

  Map<String, dynamic> toJson() => {
        'nome': name,
        'documento': document,
        'email': email,
        'telefone': phone,
        'endereco': address,
        'ativo': active,
      };
}

//  "id": 1,
//     "nome": "Cliente Demonstração",
//     "documento": "00000000000",
//     "email": "cliente@exemplo.com",
//     "telefone": "(46) 99999-0000",
//     "endereco": "Pato Branco - PR",
//     "ativo": true
